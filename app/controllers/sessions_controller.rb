class SessionsController < ApplicationController
    def new
        # @ = .new
    end
    
    def create
        user = User.find_by(email: params[:sessions][:email])
        if user && user.authenticate(params[:sessions][:password])
            session[:user_id] = user.id
            flash[:succes] = "Welcome to your page #{user}!"
            redirect_to user_url(user)
        else
            flash.now[:danger] = "Incorrect password or username"
            render "new"
        end
    end
    
    def destroy
        session[:user_id] = nil
        flash[:success] = "You have successfully logged out. Come back soon!"
        redirect_to root_url
    end
    
end