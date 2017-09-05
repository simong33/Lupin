class AddUidToCompetitor < ActiveRecord::Migration[5.0]
  def change
    add_column :competitors, :uid, :string
  end
end
