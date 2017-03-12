class CreateIngredientSensitivities < ActiveRecord::Migration
  def change
    create_table :ingredient_sensitivities do |t|
      t.integer :ingredient_id
      t.integer :sensitivity_id

      t.timestamps

    end
  end
end
