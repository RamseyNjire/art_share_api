class UsersController < ApplicationController
    def index
        if params[:username]
            users = User.where('username LIKE ?', "%#{params[:username]}%")
        else
            users = User.all
        end

        render json: users
    end

    def create
        user = User.new(user_params)

        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        render json: User.find(params[:id])
    end

    def update
        user = User.find(params[:id])

        if user.update_attributes(user_params)
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        user = User.find(params[:id])
        user.destroy
        render json: user
    end
    
    private

    def user_params
        params.require(:user).permit(:username)
    end
end
