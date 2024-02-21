class UserController < ApplicationController
    def create 
        @user = User.new(user_params)
        if @user.save
            render json: @user, status: :created
        else
            render json: {errors: @user.errors.full_messages} , status: :unprocessable_entity
        end
    end

    def update 
        @user = @current_user
        if @user.update(user_params)
            render json: @user , status: :ok
        else 
            render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def show 
        render json: @current_user
    end

    private
    def user_params
        params.require(:user).permit(:name, :password, :email, :phone_number);
    end
end
