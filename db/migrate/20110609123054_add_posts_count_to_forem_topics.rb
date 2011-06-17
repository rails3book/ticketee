class AddPostsCountToForemTopics < ActiveRecord::Migration
  def change
    add_column :forem_topics, :posts_count, :integer, :default => 0
  end
end
