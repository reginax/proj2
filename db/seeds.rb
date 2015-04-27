# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Make Plant

Plant.create name: "Squash", level: rand(1..20), health: 100, space_id: 1
Plant.create name: "Tomato", level: rand(1..20), health: 100, space_id: 2
Plant.create name: "Potato", level: rand(1..20), health: 100, space_id: 3
Plant.create name: "Cucumber", level: rand(1..20), health: 100, space_id: 4

# Make other farmers
%w(McJimmy McDonald McReagan McCarter McDixon McBarack).each do |name|
  Farmer.create name: name, email: name+"@farmvillage.com", password: 'password'
end

# Make spaces
%w(1 2 3 4 5 6).each do |sp|
  Space.create name: sp, farmer_id: 1, created_at: 0, updated_at: 0
end
