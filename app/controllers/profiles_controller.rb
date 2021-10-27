# frozen_string_literal: true

class ProfilesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    @users = if params[:username]&.present?
               User.where(username: params[:username])
             else
               User.limit(20)
             end
  end

  def show
    @user = User.find_by! username: params[:username]
  end

  def add_friend
    profile_username = params[:username]
 
    @profile_user = User.where(username: profile_username)&.first

    if @profile_user
      new_request = FriendshipRequest.new
      new_request.requestor = current_user
      @profile_user.friendship_requests << new_request
    end  
  end
end
