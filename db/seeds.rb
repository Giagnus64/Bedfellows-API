# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all()
Relationship.destroy_all()


u1 = User.create(first_name: "jack", username:"jman")
u2 = User.create(first_name: "jill", username: "jgurl")
u3 = User.create(first_name: 'bob', username: "Bboy")

r1 = Relationship.create(asker_id: u1.id, askee_id: u2.id, nickname:"jacknJill")
r2 = Relationship.create(asker_id: u2.id, askee_id: u3.id, nickname:"JillnBab")
 