class UsersController < ApplicationController

    def index 
        users = User.all
        render json: users
    end

    def show
        user = User.find(params[:id])
        render json: user
    end

    def create
      user = User.new(user_params)
      if user.save
        redirect_to user_url(user)
      else
        render json: user.errors.full_messages, status: :unprocessable_entity
      end
    end
    
    def update
        user = User.find(params[:id])
        return redirect_to user_url if user.update(user_params)
        render json: user.errors.full_messages, status: :unprocessable_entity
    end

    def destroy
        user = User.find(params[:id])
        user.destroy 
        redirect_to users_url
    end

    protected

    def user_params
        params.require(:user).permit(:username)
    end

end
