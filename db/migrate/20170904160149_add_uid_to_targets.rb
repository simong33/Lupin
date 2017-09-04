class AddUidToTargets < ActiveRecord::Migration[5.0]
  def change
    add_column :targets, :uid, :string
  end
end
