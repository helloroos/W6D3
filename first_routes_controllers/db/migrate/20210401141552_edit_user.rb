class EditUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :email, :string
    rename_column :users, :name, :username
  end
end
