class CreateAnonyComments < ActiveRecord::Migration[5.0]
  def change
    create_table :anony_comments do |t|
      t.text :content
      t.integer :anony_post_id
      t.integer :user_id

      t.timestamps
    end
  end
end
