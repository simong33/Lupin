class AddInfosToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :nickname, :string
    add_column :users, :name, :string
    add_column :users, :location, :string
    add_column :users, :image, :string
    add_column :users, :description, :string
  end
end
