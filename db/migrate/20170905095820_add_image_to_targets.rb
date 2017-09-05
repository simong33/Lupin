class AddImageToTargets < ActiveRecord::Migration[5.0]
  def change
    add_column :targets, :image, :string
  end
end
