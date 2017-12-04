class Item < ApplicationRecord
  belongs_to :brand
  has_many :assemblings
  has_many :selections
end
