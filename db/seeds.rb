# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Bathroom.create(name:"Mens", position:0, occupied:false, leds_count:2)
Bathroom.create(name:"Womens", position:1, occupied:false, leds_count:2)
Bathroom.create(name:"Robots", position:2, occupied:false, leds_count:4)
