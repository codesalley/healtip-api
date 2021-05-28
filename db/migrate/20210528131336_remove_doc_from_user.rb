class RemoveDocFromUser < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :doc
  end
end
