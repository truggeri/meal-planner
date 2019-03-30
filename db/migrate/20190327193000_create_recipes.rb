class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string    :name,            null: false, limit: 50
      t.text      :description,     null: false, limit: 500
      t.bigint    :user_id,         null: false
      t.integer   :minutes_to_make,                          size: 2

      t.timestamps
    end
  end
end
