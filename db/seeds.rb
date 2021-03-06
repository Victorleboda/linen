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
angora = Material.create!(name: 'angora', climate_impact: -3.500, water_impact: 0.220, air_impact: 270.000, climate_notation: 100,water_notation: 10,air_notation: 10)
# , climate_impact: , water_impact: , air_impact: )
cachemire = Material.create!(name: 'cachemire', climate_impact: 270.000, water_impact: 100.049, air_impact: 670.000, climate_notation: 10,water_notation: 40,air_notation: 5)
# , climate_impact: , water_impact: , air_impact: )
chanvre = Material.create!(name: 'chanvre', climate_impact: 0.430, water_impact: 0.072, air_impact: 15.000, climate_notation: 95,water_notation: 25,air_notation: 30)
# , climate_impact: , water_impact: , air_impact: )
coton = Material.create!(name: 'coton', climate_impact: 1.100, water_impact: 100.110, air_impact: 7.000, climate_notation: 55,water_notation: 15,air_notation: 70)
jute = Material.create!(name: 'jute', climate_impact: 0.970, water_impact: 0.055, air_impact: 7.100, climate_notation: 60,water_notation: 30,air_notation: 65)
# , climate_impact: , water_impact: , air_impact: )
laine_de_chameau = Material.create!(name: 'laine de chameau', climate_impact: 36.000, water_impact: 0.037, air_impact: 170.000, climate_notation: 5,water_notation: 50,air_notation: 15)
# , climate_impact: , water_impact: , air_impact: )
laine = Material.create!(name: "laine", climate_impact: 9, water_impact: 6, air_impact: 8, climate_notation: 10,water_notation: 35,air_notation: 20)
laine_mohair = Material.create!(name: "laine mohair", climate_impact: 9, water_impact: 6, air_impact: 9, climate_notation: 13,water_notation: 42,air_notation: 23)
laine_de_mouton = Material.create!(name: 'laine de mouton', climate_impact: 4.700, water_impact: 0.700, air_impact: 17.000, climate_notation: 15,water_notation: 5,air_notation: 25)
# , climate_impact: , water_impact: , air_impact: )
lin = Material.create!(name: 'lin (étoupe)', climate_impact: 1.300, water_impact: 0.041, air_impact: 10.000, climate_notation: 40,water_notation: 45,air_notation: 50)
# , climate_impact: , water_impact: , air_impact: )
lin2 = Material.create!(name: 'lin (filasse)', climate_impact: 0.870, water_impact: 0.088, air_impact: 11.000, climate_notation: 65,water_notation: 20,air_notation: 45)
# , climate_impact: , water_impact: , air_impact: )
soie = Material.create!(name: 'soie', climate_impact: 1.700, water_impact: 0.055, air_impact: 48.000, climate_notation: 35,water_notation: 35,air_notation: 20)
# , climate_impact: , water_impact: , air_impact: )
polypropylene = Material.create!(name: 'bi-composant polypropylène/polyamide', climate_impact: 90.790, water_impact: 0.016, air_impact: 3.300, climate_notation: 70,water_notation: 75,air_notation: 90)
# , climate_impact: , water_impact: , air_impact: )
acrylique = Material.create!(name: "acrylique", climate_impact: 1.800, water_impact: 0.017, air_impact: 14.000, climate_notation: 30,water_notation: 70,air_notation: 35)
# , climate_impact: , water_impact: , air_impact: )
aramide = Material.create!(name: 'aramide', climate_impact: 2.200, water_impact: 0.012, air_impact: 7.900, climate_notation: 20,water_notation: 100,air_notation: 55)
# , climate_impact: , water_impact: , air_impact: )
polyamide = Material.create!(name: "polyamide 66", climate_impact: 1.300, water_impact: 0.016, air_impact: 5.000, climate_notation: 50,water_notation: 80,air_notation: 80)
# , climate_impact: , water_impact: , air_impact: )
polyester = Material.create!(name: 'polyester', climate_impact: 1.300, water_impact: 0.026, air_impact: 5.800, climate_notation: 45,water_notation: 60,air_notation: 75)
# , climate_impact: , water_impact: , air_impact: )
polyethylene = Material.create!(name: 'polyéthylène', climate_impact: 0.660, water_impact: 0.016, air_impact: 2.900, climate_notation: 80,water_notation: 85,air_notation: 95)
# , climate_impact: , water_impact: , air_impact: )
polylactide = Material.create!(name: 'polylactide', climate_impact: 0.700, water_impact: 0.031, air_impact: 4.800, climate_notation: 75,water_notation: 55,air_notation: 85)
# , climate_impact: , water_impact: , air_impact: )
polypropylene = Material.create!(name: 'polypropylène', climate_impact: 0.660, water_impact: 0.016, air_impact: 2.900, climate_notation: 85,water_notation: 90,air_notation: 100)
# , climate_impact: , water_impact: , air_impact: )
polyuréthane = Material.create!(name: 'polyuréthane', climate_impact: 2.000, water_impact: 10.015, air_impact: 13.000, climate_notation: 25,water_notation: 95,air_notation: 40)
# , climate_impact: , water_impact: , air_impact: )
viscose = Material.create!(name: 'viscose', climate_impact: 0.440, water_impact: 0.024, air_impact: 7.800, climate_notation: 90,water_notation: 65,air_notation: 60)
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
item1 = Item.new(url: url1, photo: photo1, price: 39.45, category: "pull", product_code: "1191283", title: "Pull rayé coupe longue", gender: "Femme")
item1.brand = pull_bear
item1.save!

url2 = "http://www.asos.fr/asos/asos-pull-epaules-denudees-avec-sangle/prd/8473355?clr=noir&SearchQuery=&cid=2637&gridcolumn=2&gridrow=1&gridsize=4&pge=1&pgesize=72&totalstyles=2008"
photo2 = "http://images.asos-media.com/products/asos-pull-epaules-denudees-avec-sangle/8473355-1-black?$XXL$&wid=513&fit=constrain"
item2 = Item.new(url: url2, photo: photo2, price: 33.99, category: "pull", product_code: "1126260", title: "Pull épaules dénudées avec sangle", gender: "Femme")
item2.brand = asos
item2.save!

url3 = "http://www.asos.fr/asos/asos-ultimate-pull-ras-de-cou-en-grosse-maille/prd/7667446?clr=avoinechin%C3%A9&SearchQuery=pull&gridcolumn=2&gridrow=8&gridsize=4&pge=1&pgesize=72&totalstyles=5972"
photo3 = "http://images.asos-media.com/products/asos-ultimate-pull-ras-de-cou-en-grosse-maille/7667446-1-oatmealmarl?$XXL$&wid=513&fit=constrain"
item3 = Item.new(url: url3, photo: photo3, price: 29.99, category: "pull", product_code: "1008623", title: "Ultimate - Pull ras de cou en grosse maille", gender: "Femme")
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
selection3 = Selection.new(user: seb, item: item3)
selection3.save!
