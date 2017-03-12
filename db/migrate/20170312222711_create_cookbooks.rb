class CreateCookbooks < ActiveRecord::Migration
  def change
    create_table :cookbooks do |t|
      t.integer :user_id
      t.string :name

      t.timestamps

    end
  end
end
