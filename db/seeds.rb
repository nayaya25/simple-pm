# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# sample = Array.new(10, { firstname: 'Jane', lastname: 'Doe', email: 'john@yahoo.com', password: 'secret', is_admin: true })
User.create!({ firstname: 'Jane', lastname: 'Doe', email: 'janedoe@gmail.com', password: 'password', is_admin: false })
p "Created #{User.all.count} users"
