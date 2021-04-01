class UsersController < ApplicationController

    def index 
        # render plain: 'This is an index'
        users = User.all
        render json: users
    end

    def show
        # user = User.find(params[:id])
        render json: params
        # debugger
    end

    # def create
    #     user = User.new(params.require(:user).permit(:name, :email))
    #     user.save!
    #     render json: user
        
    #     # render json: user.errors.full_messages, status: 422
    # end

    def create
      user = User.new(user_params)
      if user.save
        render json: user
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
        redirect_to user_url
    end

    def user_params
        params.require(:user).permit(:name, :email)
    end

end
