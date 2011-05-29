class AddRequestCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :request_count, :integer, :default => 0
  end
end
