class CreateSensitivies < ActiveRecord::Migration
  def change
    create_table :sensitivies do |t|
      t.string :name

      t.timestamps

    end
  end
end
