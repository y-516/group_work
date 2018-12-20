class RenameTitleColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :title, :name
  end
end
