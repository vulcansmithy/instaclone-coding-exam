class FriendshipRequest < ApplicationRecord
  include AASM

  aasm do
  end

  belongs_to :user
  belongs_to :requestor, class_name: "User", foreign_key: "requestor_id"
  
end
