class CreateCommunityComments < ActiveRecord::Migration[5.0]
  def change
    create_table :community_comments do |t|
      t.text    :content
      t.integer :community_id
      t.integer :user_id

      t.timestamps
    end
  end
end
