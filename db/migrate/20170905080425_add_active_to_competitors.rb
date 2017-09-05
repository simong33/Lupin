class AddActiveToCompetitors < ActiveRecord::Migration[5.0]
  def change
    add_column :competitors, :active, :boolean
  end
end
