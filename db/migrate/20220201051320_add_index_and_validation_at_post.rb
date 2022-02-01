class AddIndexAndValidationAtPost < ActiveRecord::Migration[6.1]
  def change
    change_column :posts, :title, :string, null: false
    change_column :posts, :content, :text, null: false
    change_column :posts, :blog_id, :integer, null: false
    change_column :posts, :user_id, :integer, null: false

    remove_column :posts, :comment_count
    add_column :posts, :comments_count, :integer, null: false, default: 0

    add_index :posts, :blog_id
    add_index :posts, :user_id
  end
end
