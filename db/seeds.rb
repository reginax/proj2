# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



# Make other farmers
farmid = 1
%w(McJimmy McDonald McReagan McCarter McDixon McBarack).each do |name|
  Farmer.create name: name, email: name+"@farmvillage.com", password: 'password', dolladollabillz: 0
  spacenum = 1
  while (spacenum <= 9)
    Space.create name: "foo", farmer_id: farmid, created_at: 0, updated_at: 0, filled: 0
    spacenum += 1
  end
  farmid += 1
end

# Make Plant
id = 1
while (id <= 6)
  Plant.create name: "Watermelon", level: rand(1..20), health:0, space_id: id
  Plant.create name: "Peach", level: rand(1..20), health:0, space_id: id + 1
  s = Space.find(id)
  s.filled = 1
  s.save
  s = Space.find(id + 1)
  s.filled = 1
  s.save
  id += 2
end

