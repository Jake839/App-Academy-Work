class CatsController < ApplicationController
    def index 
        @cats = Cat.all 
        render :index 
    end 

    def show 
        @cat = Cat.find_by(id: params[:id])
        @cat_rental_requests = CatRentalRequest.where(cat_id: @cat.id).order('start_date ASC')

        if @cat  
            render :show 
        else   
            redirect_to cats_url 
        end 
    end 

    def new 
        @cat = Cat.new
        render :new 
    end 

    def create 
        @cat = Cat.new(cat_params)

        if @cat.save
            redirect_to cat_url(@cat)
        else 
            render :new 
        end 
    end 

    def edit 
        @cat = Cat.find_by(id: params[:id])

        if @cat 
            render :edit 
        else   
            render :new 
        end 
    end 

    def update 
        @cat = Cat.find_by(id: params[:id])

        if @cat.update(cat_params)
            redirect_to cat_url(@cat)
        else  
            render :edit 
        end   
    end 

    private 

    def cat_params 
        params.require(:cat).permit(:name, :color, :birth_date, :sex, :description, :image)
    end 
end 

