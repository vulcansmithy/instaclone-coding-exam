class AddAasmStateToFriendshipRequests < ActiveRecord::Migration[6.1]
  def change
    add_column :friendship_requests, :aasm_state, :string
  end
end
