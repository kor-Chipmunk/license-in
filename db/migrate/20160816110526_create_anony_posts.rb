class CreateAnonyPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :anony_posts do |t|
      t.string :title
      t.text :content
      t.integer :user_id

      t.timestamps
    end
  end
end
