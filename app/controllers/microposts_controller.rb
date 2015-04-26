class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      respond_to do |format|
        format.html { redirect_to root_url }
        format.js
      end
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
  end

  private

    def search_params
      params.require(:term)
    end

    def micropost_params
      params.require(:micropost).permit(:content, :picture)
    end
end
