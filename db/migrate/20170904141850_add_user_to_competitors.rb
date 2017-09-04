class AddUserToCompetitors < ActiveRecord::Migration[5.0]
  def change
    add_reference :competitors, :user, foreign_key: true
  end
end
