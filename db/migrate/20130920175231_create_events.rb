class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.string :location
      t.datetime :start_date_time
      t.datetime :end_date_time

      t.timestamps
    end
  end
end
