class AddUserSensitivyCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :user_sensitivies_count, :integer
  end
end
