class SessionsController < ApplicationController
    
    def new
        if logged_in?
            redirect_to articles_path
        end
    end

    def create
        user = User.find_by(email: get_email_from_params)
        
        if user && user.authenticate(get_password_from_params)
            session[:user_id] = user.id
            redirect_to articles_path
        else
            flash[:notice] = "Email or password is incorrect"
            render 'new'
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:notice] = "Your session has finished"
        redirect_to :root
    end

    private

    def get_email_from_params
        session = params.require(:session).permit(:email)
        session[:email]
    end
    
    def get_password_from_params
        session = params.require(:session).permit(:password)
        session[:password]
    end
end