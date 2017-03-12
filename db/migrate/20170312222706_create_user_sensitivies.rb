class CreateUserSensitivies < ActiveRecord::Migration
  def change
    create_table :user_sensitivies do |t|
      t.integer :user_id
      t.integer :sensitivity_id

      t.timestamps

    end
  end
end
