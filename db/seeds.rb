# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

puts "destroying all materials, items, assemblings, selections and users"
Material.destroy_all
Item.destroy_all
Assembling.destroy_all
User.destroy_all
Selection.destroy_all
Brand.destroy_all

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
coton = Material.create(name: "coton", climate_impact: 10, water_impact: 10, air_impact: 10)
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

puts "creating brands"
new_look = Brand.new(name: "New Look")
new_look.save!

puts "creating items"
url1 = "http://www.asos.fr/new-look/new-look-pull-color-block-noir-et-gris/prd/9080710?clr=motifnoir&SearchQuery=&cid=7617&gridcolumn=4&gridrow=7&gridsize=4&pge=1&pgesize=72&totalstyles=1172"
photo1 = "http://images.asos-media.com/products/new-look-pull-color-block-noir-et-gris/9080710-1-blackpattern?$XXL$&wid=513&fit=constrain"
item1 = Item.new(url: url1, photo: photo1, price: 23.99, category: "pull", product_code: "1210863")
item1.brand = new_look
item1.save!

url2 = "http://www.asos.fr/new-look/new-look-pull-color-block-noir-et-gris/prd/9080710?clr=motifnoir&SearchQuery=&cid=7617&gridcolumn=4&gridrow=7&gridsize=4&pge=1&pgesize=72&totalstyles=1172"
photo2 = "http://images.asos-media.com/products/new-look-pull-color-block-noir-et-gris/9080710-1-blackpattern?$XXL$&wid=513&fit=constrain"
item2 = Item.new(url: url1, photo: photo1, price: 23.99, category: "pull", product_code: "1210863")
item2.brand = new_look
item2.save!

puts "creating assemblings"
assembling1 = Assembling.new(percent: 100)
assembling1.material = coton
assembling1.item = item1
assembling1.save!

assembling2 = Assembling.new(percent: 100)
assembling2.material = coton
assembling2.item = item2
assembling2.save!

puts "creating selections"
selection1 = Selection.new(user: seb, item: item1)
selection1.save!
selection2 = Selection.new(user: seb, item: item2)
selection2.save!
