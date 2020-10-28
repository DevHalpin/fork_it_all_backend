# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Seeding Data ..."

# Helper functions
def open_asset(file_name)
  File.open(Rails.root.join('db', 'seed_assets', file_name))
end

# Only run on development (local) instances not on production, etc.
unless Rails.env.development?
  puts "Development seeds only (for now)!"
  exit 0
end

# Let's do this ...


## USERS
100.times do
  email = Faker::Internet.email
  profile_picture = Faker::Fillmurray.image(grayscale: false, width: 200, height: 300)
  username = Faker::Internet.user_name(separators: %w(. _ ))
  bio = Faker::Lorem.question(word_count: 400, supplemental: false, random_words_to_add: 0)
  name = Faker::Name.name
  User.create! email: email, profile_picture: profile_picture, handle: username, name: name, bio: bio
end

## RECIPE
Recipe.create! name: "Spicy Arrabiata Penne", region: "Italian", instructions: "Bring a large pot of water to a boil. Add kosher salt to the boiling water, then add the pasta. Cook according to the package instructions, about 9 minutes. In a large skillet over medium-high heat, add the olive oil and heat until the oil starts to shimmer. Add the garlic and cook, stirring, until fragrant, 1 to 2 minutes. Add the chopped tomatoes, red chile flakes, Italian seasoning and salt and pepper to taste. Bring to a boil and cook for 5 minutes. Remove from the heat and add the chopped basil. Drain the pasta and add it to the sauce. Garnish with Parmigiano-Reggiano flakes and more basil and serve warm.", meal_image: "https://www.themealdb.com/images/media/meals/ustsqw1468250014.jpg", meal_type: "Pasta,Curry", video_url: "https://www.youtube.com/watch?v=1IszT_guI08"

## TWISTS
100.times do
  recipe_id = 1
  user_id = rand(1..100)
  tags = Faker::Food.dish
  slug = Faker::Internet.slug(glue: '_')
  is_private = Faker::Boolean.boolean(true_ratio: 0.4)
  sort_order = rand(1..100)
  content = Faker::Hacker.say_something_smart
  Twist.create! recipe_id: recipe_id, user_id: user_id, tags: tags, slug: slug, is_private: is_private, sort_order: sort_order, content: content
end


puts "DONE!"