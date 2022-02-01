class AddIndexAndValidationAtBlog < ActiveRecord::Migration[6.1]
  def change
    change_column :blogs, :title, :string, null: false
    change_column :blogs, :user_id, :integer, null: false
    add_index :blogs, :user_id
  end
end
