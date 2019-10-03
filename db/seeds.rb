# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all()
Relationship.destroy_all()


u1 = User.create(first_name: "Jack", last_name: "Slippy", username:"jman", password:"yes")
u2 = User.create(first_name: "Jill", last_name: "Bippy", username: "jgurl", password: "yes")
u3 = User.create(first_name: 'Bob', last_name: "Baran", username: "Bob", password: "yes")
u4 = User.create(first_name: 'Frodo', last_name: "Baggins", username: "Hobbit", password: "yes")
u5 = User.create(first_name: 'Sam', last_name: "Gamgee", username:"RingBoi", password:"yes")
u6 = User.create(first_name: 'Barbra', last_name: "Ann", username:"DreamGurl", password:"yes")
u7 = User.create(first_name: 'Shrek', last_name: "Ogreman", username:"BigGreen", password:"yes")
u8 = User.create(first_name: 'Fiona', last_name: "Ogreman", username:"SwampGurl", password:"yes")

r1 = Relationship.create(asker_id: u1.id, askee_id: u2.id, nickname:"jacknJill", status: "confirmed", anniversary: "2018-10-03 12:00:00")
r2 = Relationship.create(asker_id: u2.id, askee_id: u3.id, nickname:"JillnBab", status: "pending")
r3 = Relationship.create(asker_id: u3.id, askee_id: u1.id, nickname: "JacknBOBBBYY", status: "denied")
r4 = Relationship.create(asker_id: u3.id, askee_id: u6.id, nickname:"BobBra", status: "confirmed", anniversary: "2018-10-03 12:00:00")
r5 = Relationship.create(asker_id: u3.id, askee_id: u7.id, nickname:"ShrekBob", status: "pending")
r6 = Relationship.create(asker_id: u5.id, askee_id: u4.id, nickname:"Hobbitses", status: "confirmed",anniversary: "2003-10-03 12:00:00")
r7 = Relationship.create(asker_id: u7.id, askee_id: u8.id, nickname:"Ogre Love", status: "confirmed",anniversary: "2003-10-03 12:00:00")
r7 = Relationship.create(asker_id: u5.id, askee_id: u8.id, nickname:"Ogre Hobbit Affair", status: "denied")
r8 = Relationship.create(asker_id: u3.id, askee_id: u5.id, nickname:"Best Buds", status: "pending")





o1 = Outing.create(relationship_id: r1.id, time: "2019-12-03 20:00:00", activity:"Bowling", location: "Suncoast")
o2 = Outing.create(relationship_id: r1.id, time: "2019-12-20 20:00:00", activity:"Axe Throwing", location: "Dumbo Axe Haus")
o3 = Outing.create(relationship_id: r3.id, time: "2019-05-03 20:00:00", activity:"Bungee Jumping", location: "Brooklyn Bridge")
o4 = Outing.create(relationship_id: r4.id, time: "2018-12-20 20:00:00", activity:"Ice Cream Eating", location: "Ample Hills")
o5 = Outing.create(relationship_id: r1.id, time: "2016-11-03 20:00:00", activity:"Hot Dog Eating", location: "Mah Swamp")
o6 = Outing.create(relationship_id: r5.id, time: "2019-10-20 20:00:00", activity:"Movies and Dinner", location: "Nighthawk")
o7 = Outing.create(relationship_id: r2.id, time: "2019-01-24 20:00:00", activity:"Netflix And Chill", location: "Jill's Place")
 