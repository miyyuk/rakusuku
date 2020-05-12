class AddLookedCountToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :looked_count, :integer
  end
end
