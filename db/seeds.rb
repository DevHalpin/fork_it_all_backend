# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'
I18n.reload!


puts "Seeding Data ..."

# Only run on development (local) instances not on production, etc.
unless Rails.env.development?
  puts "Development seeds only (for now)!"
  exit 0
end

# Let's do this ...

puts "Creating Users ..."
## USERS
5.times do
  access_token = SecureRandom.hex
  email = Faker::Internet.unique.email
  profile_picture = Faker::Fillmurray.image(grayscale: false, width: 200, height: 300)
  username = Faker::Internet.unique.user_name(separators: %w(. _ ))
  bio = Faker::Lorem.question(word_count: 100, supplemental: false, random_words_to_add: 0)
  name = Faker::Name.name
  User.create! access_token: access_token, email: email, profile_picture: profile_picture, handle: username, name: name, bio: bio, password: "1234", password_confirmation: "1234"
end

puts "Users Complete!"
puts "Creating Recipes ..."
## RECIPE

5.times do
  name = Faker::Food.dish 
  region = Faker::Coffee.origin 
  instructions = Faker::Food.description 
  meal_image = 'http://lorempixel.com/640/480/food/' 
  meal_type = Faker::Coffee.notes 
  video_url = "https://mityurl.com/y/TEDT/r-5-25"
  ingredient1 = Faker::Food.ingredient
  ingredient2 = Faker::Food.ingredient
  ingredient3 = Faker::Food.ingredient
  ingredient4 = Faker::Food.ingredient
  ingredient5 = Faker::Food.ingredient
  ingredient6 = Faker::Food.ingredient
  ingredient7 = Faker::Food.ingredient
  ingredient8 = Faker::Food.ingredient
  ingredient9 = Faker::Food.ingredient
  ingredient10 = Faker::Food.ingredient
  ingredient11 = Faker::Food.ingredient
  ingredient12 = Faker::Food.ingredient
  ingredient13 = Faker::Food.ingredient
  ingredient14 = Faker::Food.ingredient
  ingredient15 = Faker::Food.ingredient
  ingredient16 = Faker::Food.ingredient
  ingredient17 = Faker::Food.ingredient
  ingredient18 = Faker::Food.ingredient
  ingredient19 = Faker::Food.ingredient
  ingredient20 = Faker::Food.ingredient
  measure1 = Faker::Food.measurement
  measure2 = Faker::Food.metric_measurement
  measure3 = Faker::Food.measurement
  measure4 = Faker::Food.metric_measurement
  measure5 = Faker::Food.measurement
  measure6 = Faker::Food.metric_measurement
  measure7 = Faker::Food.measurement
  measure8 = Faker::Food.metric_measurement
  measure9 = Faker::Food.measurement
  measure10 = Faker::Food.metric_measurement
  measure11 = Faker::Food.measurement
  measure12 = Faker::Food.metric_measurement
  measure13 = Faker::Food.measurement
  measure14 = Faker::Food.metric_measurement
  measure15 = Faker::Food.measurement
  measure16 = Faker::Food.metric_measurement
  measure17 = Faker::Food.measurement
  measure18 = Faker::Food.metric_measurement
  measure19 = Faker::Food.measurement
  measure20 = Faker::Food.metric_measurement

  Recipe.create! name: name,
    region: region,
    instructions: instructions,
    meal_image: meal_image,
    meal_type: meal_type,
    video_url: video_url,
    ingredient1: ingredient1,
    ingredient2: ingredient2,
    ingredient3: ingredient3,
    ingredient4: ingredient4,
    ingredient5: ingredient5,
    ingredient6: ingredient6,
    ingredient7: ingredient7,
    ingredient8: ingredient8,
    ingredient9: ingredient9,
    ingredient10: ingredient10,
    ingredient11: ingredient11,
    ingredient12: ingredient12,
    ingredient13: ingredient13,
    ingredient14: ingredient14,
    ingredient15: ingredient15,
    ingredient16: ingredient16,
    ingredient17: ingredient17,
    ingredient18: ingredient18,
    ingredient19: ingredient19,
    ingredient20: ingredient20,
    measure1: measure1,
    measure2: measure2,
    measure3: measure3,
    measure4: measure4,
    measure5: measure5,
    measure6: measure6,
    measure7: measure7,
    measure8: measure8,
    measure9: measure9,
    measure10: measure10,
    measure11: measure11,
    measure12: measure12,
    measure13: measure13,
    measure14: measure14,
    measure15: measure15,
    measure16: measure16,
    measure17: measure17,
    measure18: measure18,
    measure19: measure19,
    measure20: measure20
end

puts "Recipes Complete!"
puts "Creating Twists ..."

## TWISTS
5.times do
  recipe_id = rand(1..5)
  user_id = rand(1..5)
  tags = Faker::Food.dish
  slug = Faker::Internet.slug(glue: '_')
  is_private = Faker::Boolean.boolean(true_ratio: 0.4)
  content = Faker::Hacker.say_something_smart
  Twist.create! recipe_id: recipe_id, user_id: user_id, tags: tags, slug: slug, is_private: is_private, content: content
end


puts "DONE!"