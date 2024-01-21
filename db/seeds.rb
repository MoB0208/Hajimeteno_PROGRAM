# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
   email: 'gaklgjairjga@admin',
   password: 'fnjdaskfhauue'
)

Grenre.create!(
   [
      {id: 1, genre: "Javascript"}
      {id: 2, genre: "Java"}
      {id: 3, genre: "PHP"}
      {id: 4, genre: "C"}
      {id: 5, genre: "C++"}
   ]
)