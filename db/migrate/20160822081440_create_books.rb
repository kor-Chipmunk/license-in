class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :title
      t.text :content
      t.integer :price
      t.integer :user_id
      t.string :image_url, default:""
      t.string :avatar

      t.timestamps
    end
  end
end
