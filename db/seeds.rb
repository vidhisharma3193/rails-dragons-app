# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Dragon.destroy_all

usr1 = User.create(name:'Jake Doe')
usr2 = User.create(name:'Samantha Bee')

Dragon.create(name:'Min',age:2200,user_id:usr1.id)
Dragon.create(name:'Vim',age:2800,user_id:usr2.id)
Dragon.create(name:'Miv',age:2300,user_id:usr2.id)
