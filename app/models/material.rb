class Material < ApplicationRecord
  has_many :assemblings, dependent: :destroy
  # validates :climate_impact, :water_impact, :air_impact, presence: true
  validates :name, presence: true, uniqueness: true
end
