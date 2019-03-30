class CreateRecipeIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_ingredients do |t|
      t.bigint      :recipe_id,       null: false
      t.bigint      :ingredient_id,   null: false
      t.integer     :amount,          null: false, size: 2
      t.integer     :measure,         null: false
      t.boolean     :precise_amount,  null: false, default: false
      t.timestamps
    end

    add_index :recipe_ingredients, %i[recipe_id ingredient_id], unique: true
  end
end
