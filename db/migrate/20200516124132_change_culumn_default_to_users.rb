class ChangeCulumnDefaultToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :avater, :integer, default: "default_avater.jpg"
    change_column :users, :timetable, :integer, default: "default_timetable_image.png"
  end
end
