class CreateCookbookMeals < ActiveRecord::Migration
  def change
    create_table :cookbook_meals do |t|
      t.integer :cookbook_id
      t.integer :meal_id

      t.timestamps

    end
  end
end
