class CreateTargets < ActiveRecord::Migration[5.0]
  def change
    create_table :targets do |t|
      t.string :name
      t.string :location
      t.string :friends_count
      t.string :followers_count
      t.string :email
      t.string :description

      t.timestamps
    end
  end
end
