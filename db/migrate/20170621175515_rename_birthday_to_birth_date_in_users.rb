class RenameBirthdayToBirthDateInUsers < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :birthday, :birth_date
  end
end
