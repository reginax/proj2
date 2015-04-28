# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Make Plant

id = 1
while (id <= 6)
  Plant.create name: "Watermelon", level: rand(1..20), health:0, space_id: id
  Plant.create name: "Peach", level: rand(1..20), health:0, space_id: id + 1
  id += 2
end


# Make other farmers
%w(McJimmy McDonald McReagan McCarter McDixon McBarack).each do |name|
  Farmer.create name: name, email: name+"@farmvillage.com", password: 'password', dolladollabillz: 0
end

# Make spaces
id = 1
while (id <= 9)
  Space.create name: "foo", farmer_id: 1, created_at: 0, updated_at: 0
  id += 1
end
