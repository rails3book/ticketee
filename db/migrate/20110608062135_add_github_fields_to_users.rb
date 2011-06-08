class AddGithubFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :github_id, :integer
    add_column :users, :github_user_name, :string
    add_column :users, :github_display_name, :string
  end
end