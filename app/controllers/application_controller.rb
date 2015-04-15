class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  def hello
    render text: "hello. le monde!"
  end

  def search
    params.require(:term)
    @microposts = Micropost.search(params[:term]).paginate(page: params[:page])
    @users = User.search(params[:term]).paginate(page: params[:page])
  end

  private

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
