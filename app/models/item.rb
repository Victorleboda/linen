# frozen_string_literal: true

class Item < ApplicationRecord
  belongs_to :brand
  has_many :assemblings, dependent: :destroy
  has_many :selections, dependent: :destroy
  validates :title, :category, :price, :url, :photo, presence: true
  validates :product_code, uniqueness: true, presence: true

  LIMIT = { climate: { min: 25, max: 40 }, water: { min: 25, max: 40 }, air: { min: 25, max: 40 } }.freeze

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
