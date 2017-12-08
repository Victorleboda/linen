# frozen_string_literal: true

class Item < ApplicationRecord
  belongs_to :brand
  has_many :assemblings, dependent: :destroy
  has_many :selections, dependent: :destroy
  validates :title, :category, :price, :url, :photo, :gender, presence: true
  validates :product_code, uniqueness: true, presence: true

  LIMIT = { climate: { min: 3.166, max: 5.276 }, water: { min: 0.061, max: 0.101 }, air: { min: 48.469, max: 80.781 } }.freeze

  def calcul_climate_impact
    self.assemblings.inject(0) do |memo, assembling|
      return nil if assembling.material.climate_impact.nil?
      memo.to_i + (assembling.percent * 0.01 * assembling.material.climate_impact)
    end
  end

  def calcul_water_impact
    item_water_impact = 0
    self.assemblings.each do |assembling|
      return nil if assembling.material.water_impact.nil?
      item_water_impact += (assembling.percent * 0.01 * assembling.material.water_impact)
    end
    return item_water_impact
  end

  def calcul_air_impact
    item_air_impact = 0
    self.assemblings.each do |assembling|
      return nil if assembling.material.air_impact.nil?
      item_air_impact += (assembling.percent * 0.01 * assembling.material.air_impact)
    end
    return item_air_impact
  end

  def color_climate
    if calcul_climate_impact.nil?
      "climate not evaluated yet"
    elsif calcul_climate_impact > LIMIT[:climate][:max]
      'bad_impact'
    elsif calcul_climate_impact < LIMIT[:climate][:min]
      'good_impact'
    else
      'normal_impact'
    end
  end

  def color_water
    if calcul_water_impact.nil?
      "water not evaluated yet"
    elsif calcul_water_impact > LIMIT[:water][:max]
      'bad_impact'
    elsif calcul_water_impact < LIMIT[:water][:min]
      'good_impact'
    else
      'normal_impact'
    end
  end

  def color_air
    if calcul_air_impact.nil?
      "air not evaluated yet"
    elsif calcul_air_impact > LIMIT[:air][:max]
      'bad_impact'
    elsif calcul_air_impact < LIMIT[:air][:min]
      'good_impact'
    else
      'normal_impact'
    end
  end

  def alternatives
    alternative_items = []
    category_items = Item.where(category: self.category).where(gender: self.gender).where.not(id: self.id)
    category_items.each do |category_item|
      if (category_item.color_water == "good_impact") && (category_item.color_air == "good_impact") && (category_item.color_climate == "good_impact")
        alternative_items << category_item
      end
    end
    return alternative_items
  end
end
