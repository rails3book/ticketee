class AddPreviousStateIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :previous_state_id, :integer
  end
end
