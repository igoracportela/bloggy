class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.integer  :blog_id
      t.integer  :user_id
      t.string   :title
      t.text     :content
      t.datetime :published_at
      t.timestamps
    end
  end
end
