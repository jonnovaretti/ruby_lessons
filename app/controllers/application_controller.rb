class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(read_user_id_from_session) if read_user_id_from_session
  end

  def logged_in?
    !!current_user
  end

  def require_user
    unless logged_in?
      flash[:notice] = 'You have to log in'
      redirect_to login_path
    end
  end

  private

  def read_user_id_from_session
    session[:user_id]
  end
end
