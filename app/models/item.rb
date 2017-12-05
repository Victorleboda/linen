class Item < ApplicationRecord
  belongs_to :brand
  has_many :assemblings, dependent: :destroy
  has_many :selections, dependent: :destroy
  validates :category, :price, :url, :photo, :product_code, presence: true

  LIMIT = {climate: {min: 25, max: 40}, water: {min: 25, max: 40}, air: {min: 25, max: 40}}

  def calcul_climate_impact
    self.assemblings.inject(0) { |memo, assembling| memo + (assembling.percent * 0.01 * assembling.material.climate_impact) }
  end

  def calcul_water_impact
    item_climate_impact = 0
    self.assemblings.each do |assembling|
      item_climate_impact += (assembling.percent * 0.01 * assembling.material.water_impact)
    end
    return item_climate_impact
  end

  def calcul_air_impact
    item_climate_impact = 0
    self.assemblings.each do |assembling|
      item_climate_impact += (assembling.percent * 0.01 * assembling.material.air_impact)
    end
    return item_climate_impact
  end

  def color_climate
    if self.calcul_climate_impact > LIMIT[:climate][:max]
      return "red"
    elsif self.calcul_climate_impact < LIMIT[:climate][:min]
      return "green"
    else
      return "orange"
    end
  end

  def color_water
    if self.calcul_water_impact > LIMIT[:water][:max]
      return "red"
    elsif self.calcul_water_impact < LIMIT[:water][:min]
      return "green"
    else
      return "orange"
    end
  end

  def color_air
    if self.calcul_air_impact > LIMIT[:air][:max]
      return "red"
    elsif self.calcul_air_impact < LIMIT[:air][:min]
      return "green"
    else
      return "orange"
    end
  end
end
