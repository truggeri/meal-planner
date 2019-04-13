class SwitchBtUsertoAccount < ActiveRecord::Migration[5.2]
  def change
    remove_column :ingredients, :user_id,    :bigint
    add_column    :ingredients, :account_id, :bigint

    remove_column :recipes, :user_id,    :bigint
    add_column    :recipes, :account_id, :bigint
  end
end
