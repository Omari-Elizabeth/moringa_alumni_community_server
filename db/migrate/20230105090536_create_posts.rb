class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.text :title
      t.text :content
      t.integer :likes
      t.integer :user_id

      t.timestamps
    end
  end
end