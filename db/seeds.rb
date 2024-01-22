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

Genre.create!(
  [
    { id: 1, genre_name: "JavaScript" },
    { id: 2, genre_name: "Java" },
    { id: 3, genre_name: "PHP" },
    { id: 4, genre_name: "C" },
    { id: 5, genre_name: "C++" },
    { id: 6, genre_name: "C#" },
    { id: 7, genre_name: "TypeScript" },
    { id: 8, genre_name: "Shell" },
    { id: 9, genre_name: "Ruby" },
    { id: 10, genre_name: "Python" },
    { id: 11, genre_name: "Go" },
    { id: 12, genre_name: "Kotlin" },
    { id: 13, genre_name: "HTML" },
    { id: 14, genre_name: "CSS" },
    { id: 15, genre_name: "SQL" },
    { id: 16, genre_name: "Swift" },
    { id: 17, genre_name: "Visual Basic" },
    { id: 18, genre_name: "Ruby on Rails" },
    { id: 19, genre_name: "Sinatra" },
    { id: 20, genre_name: "Padrino" },
    { id: 21, genre_name: "AngularJS" },
    { id: 22, genre_name: "Vue.js" },
    { id: 23, genre_name: "Ember.js" },
    { id: 24, genre_name: "Spring Framework" },
    { id: 25, genre_name: "JavaServer Faces" },
    { id: 26, genre_name: "Play Framework" },
    { id: 27, genre_name: "CakePHP" },
    { id: 28, genre_name: "Laravel" },
    { id: 29, genre_name: "FuelPHP" },
    { id: 30, genre_name: "Django" },
    { id: 31, genre_name: "Flask" },
    { id: 32, genre_name: "Bootstrap" },
    { id: 33, genre_name: "Foundation" },
    { id: 34, genre_name: "UIkit" },
    { id: 35, genre_name: "React" }
  ]
 )
# Genre.create!(
#    {id: 1, genre_name: "JavaScript"},
#    {id: 2, genre_name: "Java"},
#    {id: 3, genre_name: "PHP"},
#    {id: 4, genre_name: "C"},
#    {id: 5, genre_name: "C++"},
#    {id: 6, genre_name: "C#"},
#    {id: 7, genre_name: "TypeScript"},
#    {id: 8, genre_name: "Shell"},
#    {id: 9, genre_name: "Ruby"},
#    {id: 10, genre_name: "Python"},
#    {id: 11, genre_name: "Go"},
#    {id: 12, genre_name: "Kotlin"},
#    {id: 13, genre_name: "HTML"},
#    {id: 14, genre_name: "CSS"},
#    {id: 15, genre_name: "SQL"},
#    {id: 16, genre_name: "Swift"},
#    {id: 17, genre_name: "Visual Basic"},
#    {id: 18, genre_name: "Ruby on Rails"},
#    {id: 19, genre_name: "Sinatra"},
#    {id: 20, genre_name: "Padrino"},
#    {id: 21, genre_name: "AngularJS"},
#    {id: 22, genre_name: "Vue.js"},
#    {id: 23, genre_name: "Ember.js"},
#    {id: 24, genre_name: "Spring Framework"},
#    {id: 25, genre_name: "JavaServer Faces"},
#    {id: 26, genre_name: "Play Framework"},
#    {id: 27, genre_name: "CakePHP"},
#    {id: 28, genre_name: "Laravel"},
#    {id: 29, genre_name: "FuelPHP"},
#    {id: 30, genre_name: "Django"},
#    {id: 31, genre_name: "Flask"},
#    {id: 32, genre_name: "Bootstrap"},
#    {id: 33, genre_name: "Foundation"},
#    {id: 34, genre_name: "UIkit"},
#    {id: 35, genre_name: "React"}
# )