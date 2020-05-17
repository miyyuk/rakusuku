class ChangeColumnDefaultImagesToUsers < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :avater, :string
    change_column :users, :timetable, :string
  end

  def down
    change_column :users, :avater, :string, default: "default_avater.jpg"
    change_column :users, :timetable, :string, default: "default_timetable_image.png"
  end
end
