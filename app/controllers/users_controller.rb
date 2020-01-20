class UsersController < ApplicationController
    before_action :set_params, only: [:edit, :update, :destroy, :show]
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:success] = "Welcome to the blog #{@user.username}"
            redirect_to articles_path
        else
            render "new"
        end
    end

    def show
    end

    def edit
    end

    def update
        if user.update(user_params)
            flash[:success] = "Account updated successfully"
            redirect_to user_path(@user)
        else
            render "edit"
        end
    end

    def destroy
        @user.destroy
        flash[:danger] = "User was successfully deleted"
        redirect_to users_path
    end

    private
        def set_params
            @user = User.find(params[:id])
        end
        def user_params
            params.require(:user).permit(:username, :email, :password)
        end
end