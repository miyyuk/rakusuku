class RemoveFilesFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :files, :string
  end
end
