class CreateDoctors < ActiveRecord::Migration[6.1]
  def change
    create_table :doctors do |t|
      t.string :full_name
      t.string :email
      t.string :category
      t.string :password_digest
      t.string :location
      t.string :age
      t.integer :rating

      t.timestamps
    end
  end
end
