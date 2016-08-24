class CreateCommunities < ActiveRecord::Migration[5.0]
  def change
    create_table :communities do |t|
      t.string  :title
      t.text    :content
      t.integer :hits
      t.timestamps
    end
  end
end
