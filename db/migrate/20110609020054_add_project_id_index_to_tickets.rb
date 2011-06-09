class AddProjectIdIndexToTickets < ActiveRecord::Migration
  def change
    add_index :tickets, :project_id
  end
end
