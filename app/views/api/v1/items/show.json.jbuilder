json.extract! @item, :calcul_climate_impact, :calcul_water_impact, :calcul_air_impact, :color_climate, :color_air, :color_water
# json.alternatives @item.alternatives do |alternative|
#   json.extract! alternative, :url, :photo, :title, :price
# end

json.impact_detail_html render(partial: "items/show", locals: { item: @item }, formats: [:html])
json.alternative_html render(partial: "alternatives/show", locals: { alternatives: @item.alternatives }, formats: [:html])
