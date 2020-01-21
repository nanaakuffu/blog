class SessionsController < ApplicationController
    def new
        # @ = .new
    end
    
    def create
        # @object = Object.new(params[:object])
        # if @object.save
        #   flash[:success] = "Object successfully created"
        #   redirect_to @object
        # else
        #   flash[:error] = "Something went wrong"
        #   render 'new'
        # end
        render "new"
    end
    
    def destroy
        @object = Object.find(params[:id])
        if @object.destroy
            flash[:success] = 'Object was successfully deleted.'
            redirect_to objects_url
        else
            flash[:error] = 'Something went wrong'
            redirect_to objects_url
        end
    end
    
end