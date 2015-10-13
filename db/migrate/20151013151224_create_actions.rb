class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.text :meeting_point
      t.datetime :time
      t.string :organiser

      t.timestamps null: false
    end
  end
end
