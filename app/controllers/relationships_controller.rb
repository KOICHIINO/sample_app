class RelationshipsController < ApplicationController
  before_action :logged_in_user

# Ajax対応したコード
  def create
    @user = User.find(params[:followed_id])
    current_user.follow(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

# Ajaxを実装する前のコード
  # def create
  #   user = User.find(params[:followed_id])
  #   current_user.follow(user)
  #   redirect_to user
  # end

  # def destroy
  #   user = Relationship.find(params[:id]).followed
  #   current_user.unfollow(user)
  #   redirect_to user
  # end
  
end
