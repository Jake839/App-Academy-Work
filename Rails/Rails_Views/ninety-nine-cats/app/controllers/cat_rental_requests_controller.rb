class CatRentalRequestsController < ApplicationController

    def new 
        @cat_rental_request = CatRentalRequest.new 

        @cat_id = params[:cat_id]
        @cat_ids_and_names = get_cat_ids_and_names

        render :new 
    end 

    def create 
        @cat_rental_request = CatRentalRequest.new(cat_rental_request_params)

        if @cat_rental_request.save 
            redirect_to cat_url(@cat_rental_request.cat_id)
        else   
            redirect_to new_cat_cat_rental_request
        end 
    end 

    private 

    def cat_rental_request_params 
        params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date, :status)
    end 

    def get_cat_ids_and_names
        cat_ids_and_names = Hash.new { |hash, key| hash[key] = [] }

        Cat.all.each do |cat| 
            cat_ids_and_names[cat] << cat.id.to_s
            cat_ids_and_names[cat] << cat.name 
        end 

        cat_ids_and_names
    end 

end 