class Api::V1::UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]

    def index
        @users = User.all
        render json: @users
    end

    def show
        render json: @user
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            render json: @user
        else
            render error: {error: "Unable to create user"}, status: 400
        end
    end
    
    def update
        if @user
            @user.update(user_params)
            render json: {message: "User updated successfully"},status: 200
        else
            render json: {error: "Unable to update user"}, status: 400
        end
    end
    
    def destroy
        if @user
            @user.destroy
            render json: {message: "User deleted successfully"}, status: 200
        else
            render json: {error: "Unable to delete user"}, status: 400
        end
    end

    private

    def set_user
        @user = User.find(params[:id])
    end    

    def user_params
        params.require(:user).permit(:username, :password)
    end
    
end
