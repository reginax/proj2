# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Make Plant
%w(Squash Potato Tomato Cucumber Grape).each do |name|
  Plant.create name: name, level: rand(1..20), health: 100, space_id: 1
end

# Make other farmers
%w(McJimmy McDonald McReagan McCarter McDixon McBarack).each do |name|
  Farmer.create name: name, email: name+"@farmvillage.com", password: 'password'
end
