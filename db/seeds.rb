# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all()
Relationship.destroy_all()


u1 = User.create(first_name: "jack", last_name: "dude", username:"jman", password:"yes")
u2 = User.create(first_name: "jill", last_name: "bro", username: "jgurl", password: "yes")
u3 = User.create(first_name: 'bob', last_name: "man", username: "Bboy", password: "yes")
u4 = User.create(first_name: 'John', last_name: "Boydude", username: "J", password: "yes")

r1 = Relationship.create(asker_id: u1.id, askee_id: u2.id, nickname:"jacknJill", status: "confirmed")
r2 = Relationship.create(asker_id: u2.id, askee_id: u3.id, nickname:"JillnBab", status: "pending")
r3 = Relationship.create(asker_id: u3.id, askee_id: u1.id, nickname: "JacknBOBBBYY", status: "denied")

o1 = Outing.create(relationship_id: r1.id, time: "2019-12-03 20:00:00", activity:"Bowling")
o2 = Outing.create(relationship_id: r1.id, time: "2019-12-20 20:00:00", activity:"Axe Throwing")
o3 = Outing.create(relationship_id: r2.id, time: "2019-11-24 20:00:00", activity:"Netflix And Chill")
 