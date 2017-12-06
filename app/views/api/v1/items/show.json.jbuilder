json.extract! @item, :calcul_climate_impact, :calcul_water_impact, :calcul_air_impact, :color_climate, :color_air, :color_water



json.good_alternatives @good_alternatives do |good_alternative|
  json.extract! good_alternative, :url, :photo, :title, :price
end
