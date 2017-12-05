# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

puts "destroy all materials, items, assemblings, selections and users"

Material.destroy_all
Item.destroy_all
Assembling.destroy_all
User.destroy_all
Selection.destroy_all

puts "creating users"
seb = User.new(email: "seb@lewagon.com", password: "password")
seb.save!

puts "creating materials"
angora = Material.create(name: "angora")
# , climate_impact: , water_impact: , air_impact: )
cachemire = Material.create(name: "cachemire")
# , climate_impact: , water_impact: , air_impact: )
chanvre = Material.create(name: "chanvre")
# , climate_impact: , water_impact: , air_impact: )
coton = Material.create(name: "coton", climate_impact: 10, water_impact: 40, air_impact: 30)
jute = Material.create(name: "jute")
# , climate_impact: , water_impact: , air_impact: )
laine_de_chameau = Material.create(name: "laine de chameau")
# , climate_impact: , water_impact: , air_impact: )
laine_de_mouton = Material.create(name: "laine de mouton")
# , climate_impact: , water_impact: , air_impact: )
lin = Material.create(name: "lin (étoupe)")
# , climate_impact: , water_impact: , air_impact: )
lin2 = Material.create(name: "lin (filasse)")
# , climate_impact: , water_impact: , air_impact: )
soie = Material.create(name: "soie")
# , climate_impact: , water_impact: , air_impact: )
polypropylene = Material.create(name: "bi-composant polypropylène/polyamide")
# , climate_impact: , water_impact: , air_impact: )
acrylique = Material.create(name: "acrylique")
# , climate_impact: , water_impact: , air_impact: )
aramide = Material.create(name: "aramide")
# , climate_impact: , water_impact: , air_impact: )
polyamide = Material.create(name: "polyamide 66")
# , climate_impact: , water_impact: , air_impact: )
pokyester = Material.create(name: "polyester")
# , climate_impact: , water_impact: , air_impact: )
polyethykene = Material.create(name: "polyéthylène")
# , climate_impact: , water_impact: , air_impact: )
polylactide = Material.create(name: "polylactide")
# , climate_impact: , water_impact: , air_impact: )
polypropylene = Material.create(name: "polypropylène")
# , climate_impact: , water_impact: , air_impact: )
polyuréthane = Material.create(name: "polyuréthane")
# , climate_impact: , water_impact: , air_impact: )
viscose = Material.create(name: "viscose")
# , climate_impact: , water_impact: , air_impact: )

puts "creating items"
url1 = "http://www.asos.fr/new-look/new-look-pull-color-block-noir-et-gris/prd/9080710?clr=motifnoir&SearchQuery=&cid=7617&gridcolumn=4&gridrow=7&gridsize=4&pge=1&pgesize=72&totalstyles=1172"
photo1 = "http://images.asos-media.com/products/new-look-pull-color-block-noir-et-gris/9080710-1-blackpattern?$XXL$&wid=513&fit=constrain"
item1 = Item.new(url: url1, photo: photo1, price: 23.99, category: "pull", product_code: "1210863")
item1.brand = Brand.new(name: "New Look")
item1.save!

puts "creating assemblings"
assembling1 = Assembling.new(percent: 100)
assembling1.material = coton
assembling1.item = item1
assembling1.save!
=======
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
angora = Material.new(name: "Fil d'angora")
# , climate_impact: -3.5e+1, water_impact: 2.2e-3, air_impact:)
cachemire = Material.new(name: "Fil de cachemire")
# , climate_impact: , water_impact: , air_impact:)
chanvre = Material.new(name: "Fil de chanvre")
# , climate_impact: , water_impact: , air_impact:)
coton = Material.new(name: "Fil de coton")
# , climate_impact: , water_impact: , air_impact:)
jute = Material.new(name: "Fil de jute")
# , climate_impact: , water_impact: , air_impact:)
laine_de_chameau = Material.new(name: "Fil de laine de chameau")
# , climate_impact: , water_impact: , air_impact:)
laine_de_mouton = Material.new(name: "Fil de laine de mouton")
# , climate_impact: , water_impact: , air_impact:)
lin = Material.new(name: "Fil de lin (étoupe)")
# , climate_impact: , water_impact: , air_impact:)
lin2 = Material.new(name: "Fil de lin (filasse)")
# , climate_impact: , water_impact: , air_impact:)
soie = Material.new(name: "Fil de soie")
# , climate_impact: , water_impact: , air_impact:
polypropylene = Material.new(name: "Filament bi-composant polypropylène/polyamide")
# , climate_impact: , water_impact: , air_impact:)
acrylique = Material.new(name: "Filament d'acrylique")
# , climate_impact: , water_impact: , air_impact:)
aramide = Material.new(name: "Filament d'aramide")
# , climate_impact: , water_impact: , air_impact:)
polyamide = Material.new(name: "Filament de polyamide 66")
# , climate_impact: , water_impact: , air_impact:)
pokyester = Material.new(name: "Filament de polyester")
# , climate_impact: , water_impact: , air_impact:)
polyethykene = Material.new(name: "Filament de polyéthylène")
# , climate_impact: , water_impact: , air_impact:)
polylactide = Material.new(name: "Filament de polylactide")
# , climate_impact: , water_impact: , air_impact:)
polypropylene = Material.new(name: "Filament de polypropylène")
# , climate_impact: , water_impact: , air_impact:)
polyuréthane = Material.new(name: "Filament de polyuréthane")
# , climate_impact: , water_impact: , air_impact:)
viscose = Material.new(name: "Filament de viscose")
# , climate_impact: , water_impact: , air_impact:)


puts "creating selections"
selection1 = Selection.new(user: seb, item: item1)
selection1.save!
