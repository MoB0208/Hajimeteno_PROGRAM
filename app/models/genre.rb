class Genre < ApplicationRecord
  has_many :genre_posts, dependent: :destroy
  has_many :posts, through: :genre_posts

  # enum genre_name: {
  #   javascript: 0,
  #   java: 1,
  #   php: 2,
  #   c: 3,
  #   c_plus: 4,
  #   c_sharp: 5,
  #   typescript: 6,
  #   shell: 7,
  #   ruby: 8,
  #   python: 9,
  #   go: 10,
  #   kotlin: 11,
  #   html: 12,
  #   css: 13,
  #   sql: 14,
  #   swift: 15,
  #   visual_basic: 16,
  #   ruby_on_rails: 17,
  #   sinatra: 18,
  #   padrino: 19,
  #   angularjs: 20,
  #   vue_js: 21,
  #   ember_js: 22,
  #   spring_framework: 23,
  #   javaserver_faces: 24,
  #   play_framework: 25,
  #   cakephp: 26,
  #   laravel: 27,
  #   fuelphp: 28,
  #   django: 29,
  #   flask: 30,
  #   bootstrap: 31,
  #   foundation: 32,
  #   uikit: 33,
  #   react: 34
  # }
end
