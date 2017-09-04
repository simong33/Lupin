class CreateCompetitors < ActiveRecord::Migration[5.0]
  def change
    create_table :competitors do |t|
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
