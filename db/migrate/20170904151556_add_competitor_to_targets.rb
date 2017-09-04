class AddCompetitorToTargets < ActiveRecord::Migration[5.0]
  def change
    add_reference :targets, :competitor, foreign_key: true
  end
end
