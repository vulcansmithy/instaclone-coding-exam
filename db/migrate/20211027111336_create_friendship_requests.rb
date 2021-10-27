class CreateFriendshipRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :friendship_requests do |t|

      t.timestamps
    end
  end
end
