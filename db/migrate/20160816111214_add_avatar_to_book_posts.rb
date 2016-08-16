class AddAvatarToBookPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :book_posts, :avatar, :string
  end
end
