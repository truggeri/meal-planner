class ChangeIngredientDescription < ActiveRecord::Migration[5.2]
  def up
    change_column :ingredients, :description, :text, null: false, limit: 200
    change_column :ingredients, :name, :string, null: false, limit: 50
  end

  def down
    # Put here so I could add more functionallity to a single migration
  end 
end
