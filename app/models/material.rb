class Material < ApplicationRecord
  has_many :assemblings, dependent: :destroy
  validates :name, :climate_impact, :water_impact, :air_impact, presence: true
  validates :name, uniqueness: true
end
