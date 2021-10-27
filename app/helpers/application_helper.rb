module ApplicationHelper

  def already_initiated_friend_request?(profile_user_id, requestor_id)
    profile = User.where(id: profile_user_id)&.first
    if profile
      return profile.friendship_requests.where(requestor_id: requestor_id, aasm_state: "requested" )&.first ? true : false
    else
      return false
    end
  end 

  def friend_request_list(user)
    user.friendship_requests.where(aasm_state: "requested")
  end

  def display_follower_count(user)
    user.followers.count
  end  

end
