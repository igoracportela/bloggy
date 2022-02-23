class AddIndexAndValidationAtComment < ActiveRecord::Migration[6.1]
  def change
    change_column :comments, :content, :text, null: false
    change_column :comments, :blog_id, :integer, null: false
    change_column :comments, :post_id, :integer, null: false
    change_column :comments, :user_id, :integer, null: false
    add_index :comments, :blog_id
    add_index :comments, :post_id
    add_index :comments, :user_id
  end
end
