class Item < ApplicationRecord
  belongs_to :brand
  has_many :assemblings, dependent: :destroy
  has_many :selections, dependent: :destroy
  validates :title, :category, :price, :url, :photo, presence: true
  validates :product_code, uniqueness: true, presence: true

  LIMIT = {climate: {min: 25, max: 40}, water: {min: 25, max: 40}, air: {min: 25, max: 40}}

  def calcul_climate_impact
    self.assemblings.inject(0) { |memo, assembling| memo.to_i + (assembling.percent * 0.01 * assembling.material.climate_impact) }
  end

  def calcul_water_impact
    item_water_impact = 0
    self.assemblings.each do |assembling|
      item_water_impact += (assembling.percent * 0.01 * assembling.material.water_impact)
    end
    return item_water_impact
  end

  def calcul_air_impact
    item_air_impact = 0
    self.assemblings.each do |assembling|
      item_air_impact += (assembling.percent * 0.01 * assembling.material.air_impact)
    end
    return item_air_impact
  end

  def color_climate
    if self.calcul_climate_impact > LIMIT[:climate][:max]
      return "bad_impact"
    elsif self.calcul_climate_impact < LIMIT[:climate][:min]
      return "good_impact"
    else
      return "normal_impact"
    end
  end

  def color_water
    if self.calcul_water_impact > LIMIT[:water][:max]
      return "bad_impact"
    elsif self.calcul_water_impact < LIMIT[:water][:min]
      return "good_impact"
    else
      return "normal_impact"
    end
  end

  def color_air
    if self.calcul_air_impact > LIMIT[:air][:max]
      return "bad_impact"
    elsif self.calcul_air_impact < LIMIT[:air][:min]
      return "good_impact"
    else
      return "normal_impact"
    end
  end

  def alternatives
    alternative_items = []
    category_items = Item.where(category: self.category).where.not(id: self.id)
    category_items.each do |category_item|
      if (category_item.color_water == "good_impact") && (category_item.color_air == "good_impact") && (category_item.color_climate == "good_impact")
        alternative_items << category_item
      end
    end
    return alternative_items
  end
end
