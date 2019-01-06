class ChangeIngredientFreshToDefaultFalse < ActiveRecord::Migration[5.2]
  def up
    change_column :ingredients, :fresh, :boolean, null: false, default: false
  end

  def down
    change_column :ingredients, :fresh, :boolean
  end
end
