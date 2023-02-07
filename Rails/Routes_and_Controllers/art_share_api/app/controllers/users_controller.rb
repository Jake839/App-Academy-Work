class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        render json: User.all 
    end 

    def create
        user = User.new(user_params) 
        
        if user.username
            user.save! 
            render json: user, status: :created
        else 
            render json: user.errors.full_messages, status: :unprocessable_entity
        end 
    end 

    def show 
        render json: User.find(params[:id]) 
    end 

    def update 
        user = User.find(params[:id])
        
        if user.update(user_params)
            render json: user 
        else 
            render json: user.errors.full_messages, status: :unprocessable_entity
        end 
    end 

    def destroy 
        user = User.find(params[:id])
        render json: user if user.destroy 
    end 

    private 

    def user_params
        params.require(:user).permit(:username)
    end 

end 