class Assembling < ApplicationRecord
  belongs_to :material
  belongs_to :item
  validates :percent, presence: true
end
