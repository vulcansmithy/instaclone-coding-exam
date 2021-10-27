class FriendshipRequest < ApplicationRecord
  
  include AASM

  belongs_to :user
  belongs_to :requestor, class_name: "User", foreign_key: "requestor_id"

  aasm whiny_transitions: false do
    state :requested, initial: true
    state :accepted
    state :declined

    event :friendship_accepted do
      transitions from: :requested, to: :accepted

      after do
        self.save!
      end
    end  

    event :friendship_declined do
      transitions from: :requested, to: :declined

      after do
        self.save!
      end 
    end  
  end

  
end
