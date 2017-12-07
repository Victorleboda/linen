# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

puts 'destroying all materials, items, assemblings, selections and users'

Material.destroy_all
Item.destroy_all
Assembling.destroy_all
User.destroy_all
Selection.destroy_all
Brand.destroy_all

puts 'creating users'
seb = User.new(email: 'seb@lewagon.com', password: 'password')
seb.save!

puts 'creating materials'
angora = Material.create!(name: 'angora', climate_impact: 9, water_impact: 10, air_impact: 2)
# , climate_impact: , water_impact: , air_impact: )
cachemire = Material.create!(name: 'cachemire', climate_impact: 9, water_impact: 10, air_impact: 2)
# , climate_impact: , water_impact: , air_impact: )
chanvre = Material.create!(name: 'chanvre', climate_impact: 9, water_impact: 10, air_impact: 2)
# , climate_impact: , water_impact: , air_impact: )
coton = Material.create!(name: 'coton', climate_impact: 10, water_impact: 10, air_impact: 10)
jute = Material.create!(name: 'jute', climate_impact: 9, water_impact: 10, air_impact: 2)
# , climate_impact: , water_impact: , air_impact: )
laine_de_chameau = Material.create!(name: 'laine de chameau', climate_impact: 9, water_impact: 10, air_impact: 2)
# , climate_impact: , water_impact: , air_impact: )
laine = Material.create!(name: "laine", climate_impact: 9, water_impact: 6, air_impact: 8)
laine_mohair = Material.create!(name: "laine mohair", climate_impact: 9, water_impact: 6, air_impact: 9)
laine_de_mouton = Material.create!(name: 'laine de mouton', climate_impact: 9, water_impact: 10, air_impact: 2)
# , climate_impact: , water_impact: , air_impact: )
lin = Material.create!(name: 'lin (étoupe)', climate_impact: 9, water_impact: 10, air_impact: 2)
# , climate_impact: , water_impact: , air_impact: )
lin2 = Material.create!(name: 'lin (filasse)', climate_impact: 9, water_impact: 10, air_impact: 2)
# , climate_impact: , water_impact: , air_impact: )
soie = Material.create!(name: 'soie', climate_impact: 9, water_impact: 10, air_impact: 2)
# , climate_impact: , water_impact: , air_impact: )
polypropylene = Material.create!(name: 'bi-composant polypropylène/polyamide', climate_impact: 9, water_impact: 10, air_impact: 2)
# , climate_impact: , water_impact: , air_impact: )
acrylique = Material.create!(name: "acrylique", climate_impact: 9, water_impact: 10, air_impact: 2)
# , climate_impact: , water_impact: , air_impact: )
aramide = Material.create!(name: 'aramide', climate_impact: 9, water_impact: 10, air_impact: 2)
# , climate_impact: , water_impact: , air_impact: )
polyamide = Material.create!(name: "polyamide 66", climate_impact: 10, water_impact: 10, air_impact: 10)
# , climate_impact: , water_impact: , air_impact: )
pokyester = Material.create!(name: 'polyester', climate_impact: 9, water_impact: 10, air_impact: 2)
# , climate_impact: , water_impact: , air_impact: )
polyethykene = Material.create!(name: 'polyéthylène', climate_impact: 9, water_impact: 10, air_impact: 2)
# , climate_impact: , water_impact: , air_impact: )
polylactide = Material.create!(name: 'polylactide', climate_impact: 9, water_impact: 10, air_impact: 2)
# , climate_impact: , water_impact: , air_impact: )
polypropylene = Material.create!(name: 'polypropylène', climate_impact: 9, water_impact: 10, air_impact: 2)
# , climate_impact: , water_impact: , air_impact: )
polyuréthane = Material.create!(name: 'polyuréthane', climate_impact: 9, water_impact: 10, air_impact: 2)
# , climate_impact: , water_impact: , air_impact: )
viscose = Material.create!(name: 'viscose', climate_impact: 9, water_impact: 10, air_impact: 2)
# , climate_impact: , water_impact: , air_impact: )

puts 'creating brands'
new_look = Brand.new(name: 'New Look')
new_look.save!
pull_bear = Brand.new(name: "Pull Bear")
pull_bear.save!
asos = Brand.new(name: "ASOS")
asos.save!

puts "creating items"
url1 = "http://www.asos.fr/pullbear/pullbear-pull-raye-coupe-longue/prd/8938640?clr=multi&SearchQuery=pull&gridcolumn=2&gridrow=6&gridsize=4&pge=1&pgesize=72&totalstyles=5769"
photo1 = "http://images.asos-media.com/products/pullbear-pull-raye-coupe-longue/8938640-1-multi?$XXL$&wid=513&fit=constrain"
item1 = Item.new(url: url1, photo: photo1, price: 39.45, category: "pull", product_code: "1191283", title: "Pull rayé coupe longue")
item1.brand = pull_bear
item1.save!

url2 = "http://www.asos.fr/new-look/new-look-pull-color-block-noir-et-gris/prd/9080710?clr=motifnoir&SearchQuery=&cid=7617&gridcolumn=4&gridrow=7&gridsize=4&pge=1&pgesize=72&totalstyles=1172"
photo2 = "http://images.asos-media.com/products/new-look-pull-color-block-noir-et-gris/9080710-1-blackpattern?$XXL$&wid=513&fit=constrain"
item2 = Item.new(url: url2, photo: photo2, price: 23.99, category: "pull", product_code: "1210864", title: "Pull 2")
item2.brand = new_look
item2.save!

url3 = "http://www.asos.fr/asos/asos-ultimate-pull-ras-de-cou-en-grosse-maille/prd/7667446?clr=avoinechin%C3%A9&SearchQuery=pull&gridcolumn=2&gridrow=8&gridsize=4&pge=1&pgesize=72&totalstyles=5972"
photo3 = "http://images.asos-media.com/products/asos-ultimate-pull-ras-de-cou-en-grosse-maille/7667446-1-oatmealmarl?$XXL$&wid=513&fit=constrain"
item3 = Item.new(url: url3, photo: photo3, price: 29.99, category: "pull", product_code: "1008623", title: "Ultimate - Pull ras de cou en grosse maille")
item3.brand = asos
item3.save!

puts "creating assemblings"
assembling1 = Assembling.new(percent: 51)
assembling1.material = acrylique

assembling1.item = item1
assembling1.save!

assembling2 = Assembling.new(percent: 39)
assembling2.material = polyamide
assembling2.item = item1
assembling2.save!

assembling3 = Assembling.new(percent: 6)
assembling3.material = laine_mohair
assembling3.item = item1
assembling3.save!

assembling4 = Assembling.new(percent: 4)
assembling4.material = laine
assembling4.item = item1
assembling4.save!

assembling5 = Assembling.new(percent: 100)
assembling5.material = coton
assembling5.item = item2
assembling5.save!

assembling6 = Assembling.new(percent: 100)
assembling6.material = acrylique
assembling6.item = item3
assembling6.save!

puts 'creating selections'

selection1 = Selection.new(user: seb, item: item1)
selection1.save!
selection2 = Selection.new(user: seb, item: item2)
selection2.save!
