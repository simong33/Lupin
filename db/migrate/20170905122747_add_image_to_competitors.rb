class AddImageToCompetitors < ActiveRecord::Migration[5.0]
  def change
    add_column :competitors, :image, :string
  end
end
