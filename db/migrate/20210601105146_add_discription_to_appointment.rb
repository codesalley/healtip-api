class AddDiscriptionToAppointment < ActiveRecord::Migration[6.1]
  def change
    add_column :appointments, :info, :string
  end
end
