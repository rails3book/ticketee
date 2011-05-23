class AddDefaultToStates < ActiveRecord::Migration
  def change
    add_column :states, :default, :boolean, :default => false
  end
end
