class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text       :content, null: false
      t.string     :image
      t.references :group, foreign_key: true
      t.references :user,  foreign_key: true
      t.boolean    :release_check, default: false, null: false
      t.date       :release_date
      t.timestamps
    end
  end
end
