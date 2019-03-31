class DropEmailFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :email, :string, null: false, limit: 100
  end
end
