class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string    :name,      null: false, limit: 50
      t.string    :email,     null: false, limit: 100
      t.boolean   :active,    null: false,            default: true

      t.timestamps
    end

    add_index :users, :email
  end
end
