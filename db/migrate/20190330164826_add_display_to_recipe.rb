class AddDisplayToRecipe < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :display, :boolean
    add_index  :recipes, :display
  end
end
