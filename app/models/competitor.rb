class Competitor < ApplicationRecord
  belongs_to :user
  has_many :targets
  validates :user_id, uniqueness: {scope: :nickname}
end
