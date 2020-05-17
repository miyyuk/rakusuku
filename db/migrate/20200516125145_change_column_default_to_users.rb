class ChangeColumnDefaultToUsers < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :avater, :string, default: "default_avater.jpg"
    change_column :users, :timetable, :string, default: "default_timetable_image.png"
  end

  def down
    change_column :users, :avater, :integer, default: "default_avater.jpg"
    change_column :users, :timetable, :integer, default: "default_timetable_image.png"
  end
end
