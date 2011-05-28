class CreateTicketWatchersTable < ActiveRecord::Migration
  def change
    create_table :ticket_watchers, :id => false do |t|
      t.integer :user_id, :ticket_id
    end
  end
end