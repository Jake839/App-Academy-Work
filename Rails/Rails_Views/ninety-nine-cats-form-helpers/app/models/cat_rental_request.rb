# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :bigint           not null, primary key
#  cat_id     :bigint           not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null

class CatRentalRequest < ApplicationRecord 
    STATUS = ["PENDING", "APPROVED", "DENIED"]

    validates :cat_id, :start_date, :end_date, :status, presence: true
    validates :status, :inclusion => { :in => STATUS, :message => "%{value} is not a valid status. Choose 'PENDING', 'APPROVED', or 'DENIED'." }
    validate :does_not_overlap_approved_request

    belongs_to :cat,
        primary_key: :id, #cats table 
        foreign_key: :cat_id, 
        class_name: :Cat

    def approve! 
        self.transaction do 
            self.status = 'APPROVED'
            self.save! 
            overlapping_pending_requests.each { |request| request.deny!(request) } 
        end 
    end 

    def deny!(request)
        request.status = 'DENIED'
        request.save!
    end 

    def pending? 
        self.status == 'PENDING'
    end 

    private 

    def at_least_one_rental_request_exists? 
        CatRentalRequest.first != nil 
    end 

    def overlapping_requests 
        CatRentalRequest.where(start_date: self.start_date..self.end_date).or(CatRentalRequest.where(end_date: self.start_date..self.end_date)).where("cat_id = #{self.cat_id}").where.not(id: self.id)
    end 

    def overlapping_approved_requests
        overlapping_requests.where(status: 'APPROVED')
    end 

    def overlapping_pending_requests
        overlapping_requests.where(status: 'PENDING')
    end 

    def any_empty_parameters?
        [self.cat_id, self.start_date, self.end_date].any? { |field| field.nil? }
    end 

    def does_not_overlap_approved_request
        if any_empty_parameters? 
            errors.add(:base, "Please fill out all fields. Select a cat, a start date, and an end date.")
        elsif at_least_one_rental_request_exists?
            if overlapping_approved_requests.exists? && self.status == 'APPROVED'
                errors.add(:base, "There's an approved cat rental request in that time period.")
            end 
        end 
    end 

end 
