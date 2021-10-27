class CreateFriendshipRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :friendship_requests do |t|
      t.references :user  
      t.timestamps
    end
  end
end
