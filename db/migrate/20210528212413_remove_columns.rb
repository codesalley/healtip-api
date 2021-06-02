# frozen_string_literal: true

class RemoveColumns < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :favorites
    add_column :users, :favorites, :json, array: true
    # Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
