class UsersController < ApplicationController
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(params.require(:user).permit(:username, :email, :password))

        if @user.save
            flash[:notice] = "Signed up with successfully. Welcome #{@user.username}."
            redirect_to articles_path
        else
            render 'new'
        end
    end
end