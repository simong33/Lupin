class Target < ApplicationRecord
  belongs_to :competitor
  has_many :follows, dependent: :destroy
end
