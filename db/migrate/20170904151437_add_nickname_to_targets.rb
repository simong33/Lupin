class AddNicknameToTargets < ActiveRecord::Migration[5.0]
  def change
    add_column :targets, :nickname, :string
  end
end
