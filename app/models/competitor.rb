class Competitor < ApplicationRecord
  belongs_to :user
  has_many :targets, dependent: :destroy
  validates :user_id, uniqueness: {scope: :nickname}
end
