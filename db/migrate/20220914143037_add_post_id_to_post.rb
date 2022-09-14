class AddPostIdToPost < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :PostIdId, :integer
    add_index :posts, :PostIdId
  end
end
