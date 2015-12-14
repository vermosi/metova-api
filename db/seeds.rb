# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
u1 = User.create(name: 'Ron', email: 'ron.swanson@pawnee.gov', password: 'anewpassword')
u2 = User.create(email: 'Leslie', email: 'leslie.knope@pawnee.gov', password: 'password')

g1 = Garage.create(name: "Leslie's Garage")
g2 = Garage.create(name:  "Andy's Garage")

c1 = u1.cars.create(make: 'Nissan', model: 'Sentra', year: '2008', garage_id: g1.id)
c2 = u2.cars.create(make: 'Toyota', model: 'Prius', year: '2015', garage_id: g2.id)


