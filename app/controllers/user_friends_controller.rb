class UserFriendsController < ApplicationController

  def create
    @user_friend = UserFriend.create(user: current_user, friend: friend)
    flash[:notice] = "Friend #{friend.first_name} was successfully added to your portfolio"
    redirect_to my_friends_path
  end

  def destroy
    friend = Friend.find(params[:id])
    user_friend = UserFriend.where(user_id: current_user.id, friend_id: friend.id).first
    user_friend.destroy
    flash[:notice] = "#{friend.first_name} was successfully removed from friend list"
    redirect_to my_friends_path
  end

end
