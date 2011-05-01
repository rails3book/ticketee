class AddUserIdToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :user_id, :integer
  end
end
