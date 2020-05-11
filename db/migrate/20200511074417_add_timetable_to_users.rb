class AddTimetableToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :timetable, :string
  end
end
