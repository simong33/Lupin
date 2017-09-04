class AddNicknameToCompetitors < ActiveRecord::Migration[5.0]
  def change
    add_column :competitors, :nickname, :string
  end
end
