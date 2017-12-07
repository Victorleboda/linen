# frozen_string_literal: true

class Item < ApplicationRecord
  belongs_to :brand
  has_many :assemblings, dependent: :destroy
  has_many :selections, dependent: :destroy
  validates :category, :price, :url, :photo, :product_code, presence: true

  LIMIT = { climate: { min: 25, max: 40 }, water: { min: 25, max: 40 }, air: { min: 25, max: 40 } }.freeze

  def calcul_climate_impact
    assemblings.inject(0) { |memo, assembling| memo + (assembling.percent * 0.01 * assembling.material.climate_impact) }
  end

  def calcul_water_impact
    item_climate_impact = 0
    assemblings.each do |assembling|
      item_climate_impact += (assembling.percent * 0.01 * assembling.material.water_impact)
    end
    item_climate_impact
  end

  def calcul_air_impact
    item_climate_impact = 0
    assemblings.each do |assembling|
      item_climate_impact += (assembling.percent * 0.01 * assembling.material.air_impact)
    end
    item_climate_impact
  end

  def color_climate
    if calcul_climate_impact > LIMIT[:climate][:max]
      'bad_impact'
    elsif calcul_climate_impact < LIMIT[:climate][:min]
      'good_impact'
    else
      'normal_impact'
    end
  end

  def color_water
    if calcul_water_impact > LIMIT[:water][:max]
      'bad_impact'
    elsif calcul_water_impact < LIMIT[:water][:min]
      'good_impact'
    else
      'normal_impact'
    end
  end

  def color_air
    if calcul_air_impact > LIMIT[:air][:max]
      'bad_impact'
    elsif calcul_air_impact < LIMIT[:air][:min]
      'good_impact'
    else
      'normal_impact'
    end
  end
end
