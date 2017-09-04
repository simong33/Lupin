class Follow < ApplicationRecord
  belongs_to :user
  belongs_to :target
  validates_uniqueness_of :user_id, :scope => [:target_id]
end
