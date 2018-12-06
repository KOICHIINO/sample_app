class LikesController < ApplicationController
  before_action :logged_in_user
  
  # いいね！ボタン押下アクション（登録）
  def create
    @micropost = Micropost.find(params[:micropost_id])
    unless @micropost.iine?(current_user)
      @micropost.doLike(current_user)
      @micropost.reload
      respond_to do |format|
        format.html { redirect_to(request.referrer || root_url) }
        format.js
      end
    end
  end

  # いいね！ボタン押下アクション（解除）
  def destroy
    @micropost = Like.find(params[:id]).micropost
    if @micropost.iine?(current_user)
      @micropost.unLike(current_user)
      @micropost.reload
      respond_to do |format|
        format.html { redirect_to(request.referrer || root_url) }
        format.js
      end
    end
  end
  
end
