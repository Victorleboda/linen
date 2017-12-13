# frozen_string_literal: true

class Item < ApplicationRecord
  belongs_to :brand
  has_many :assemblings, dependent: :destroy
  has_many :selections, dependent: :destroy
  validates :title, :category, :price, :url, :photo, :gender, presence: true
  validates :product_code, uniqueness: true, presence: true

  LIMIT = { climate: { min: 25, max: 50 }, water: { min: 25, max: 50 }, air: { min: 25, max: 50 } }.freeze

  def calcul_climate_impact
    item_climate_impact = 0
    self.assemblings.each do |assembling|
      return nil if assembling.material.climate_notation.nil?
      item_climate_impact += (assembling.percent * 0.01 * assembling.material.climate_notation)
    end
    return item_climate_impact
  end

  def calcul_water_impact
    item_water_impact = 0
    self.assemblings.each do |assembling|
      return nil if assembling.material.water_notation.nil?
      item_water_impact += (assembling.percent * 0.01 * assembling.material.water_notation)
    end
    return item_water_impact
  end

  def calcul_air_impact
    item_air_impact = 0
    self.assemblings.each do |assembling|
      return nil if assembling.material.air_notation.nil?
      item_air_impact += (assembling.percent * 0.01 * assembling.material.air_notation)
    end
    return item_air_impact
  end

  def total_impact
    return item_total_impact = (calcul_climate_impact + calcul_water_impact + calcul_air_impact)/3
  end

  def calcul_climate
    item_climate = 0
    self.assemblings.each do |assembling|
      return nil if assembling.material.climate_impact.nil?
      item_climate += (assembling.percent * 0.01 * assembling.material.climate_impact)
    end
    return item_climate
  end

  def calcul_water
    item_water = 0
    self.assemblings.each do |assembling|
      return nil if assembling.material.water_impact.nil?
      item_water += (assembling.percent * 0.01 * assembling.material.water_impact)
    end
    return item_water
  end

  def calcul_air
    item_air = 0
    self.assemblings.each do |assembling|
      return nil if assembling.material.air_impact.nil?
      item_air += (assembling.percent * 0.01 * assembling.material.air_impact)
    end
    return item_air
  end
  def color_total
    if total_impact.nil?
      "Total not evaluated yet"
    elsif total_impact > LIMIT[:climate][:max]
      'good_impact'
    elsif total_impact < LIMIT[:climate][:min]
      'bad_impact'
    else
      'normal_impact'
    end
  end

  def color_climate
    if calcul_climate_impact.nil?
      "climate not evaluated yet"
    elsif calcul_climate_impact > LIMIT[:climate][:max]
      'good_impact'
    elsif calcul_climate_impact < LIMIT[:climate][:min]
      'bad_impact'
    else
      'normal_impact'
    end
  end

  def color_water
    if calcul_water_impact.nil?
      "water not evaluated yet"
    elsif calcul_water_impact > LIMIT[:water][:max]
      'good_impact'
    elsif calcul_water_impact < LIMIT[:water][:min]
      'bad_impact'
    else
      'normal_impact'
    end
  end

  def color_air
    if calcul_air_impact.nil?
      "air not evaluated yet"
    elsif calcul_air_impact > LIMIT[:air][:max]
      'good_impact'
    elsif calcul_air_impact < LIMIT[:air][:min]
      'bad_impact'
    else
      'normal_impact'
    end
  end

  def alternatives
    alternative_items = []
    category_items = Item.where(category: self.category).where(gender: self.gender).where.not(id: self.id)
    category_items.each do |category_item|
      if (category_item.color_total == "good_impact")
        alternative_items << category_item
      end
    end
    return alternative_items
  end
end
