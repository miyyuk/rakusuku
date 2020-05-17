class ChangeColumnDefaultToPosts < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :looked_count, :integer, default: 0
  end
end
