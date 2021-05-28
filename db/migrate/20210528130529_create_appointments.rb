class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.string :name
      t.datetime :time
      t.string :category
      t.boolean :pending, :default =>  false
      t.boolean :cancel, :default =>  false
      #Ex:- :default =>''
      t.boolean :accepted, :default =>  false
      t.string :location

      t.timestamps
    end
  end
end
