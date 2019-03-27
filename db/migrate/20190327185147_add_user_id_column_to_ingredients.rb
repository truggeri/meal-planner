class AddUserIdColumnToIngredients < ActiveRecord::Migration[5.2]
  def change
    add_column :ingredients, :user_id, :bigint
  end
end
