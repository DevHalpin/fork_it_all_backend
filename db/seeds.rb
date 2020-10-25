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

User.create! email: "example@gmail.com", profile_picture: "http://www.fillmurray.com/200/300", handle: "fmurray"

## RECIPE

Recipe.create! name: "Spicy Arrabiata Penne", region: "Italian", instructions: "Bring a large pot of water to a boil. Add kosher salt to the boiling water, then add the pasta. Cook according to the package instructions, about 9 minutes. In a large skillet over medium-high heat, add the olive oil and heat until the oil starts to shimmer. Add the garlic and cook, stirring, until fragrant, 1 to 2 minutes. Add the chopped tomatoes, red chile flakes, Italian seasoning and salt and pepper to taste. Bring to a boil and cook for 5 minutes. Remove from the heat and add the chopped basil. Drain the pasta and add it to the sauce. Garnish with Parmigiano-Reggiano flakes and more basil and serve warm.", meal_image: "https://www.themealdb.com/images/media/meals/ustsqw1468250014.jpg", meal_type: "Pasta,Curry", video_url: "https://www.youtube.com/watch?v=1IszT_guI08"

## TWISTS

Twist.create! recipe_id: 1, user_id: 1, tags: "ingredient replacement", slug: "dsdsad72dyw", is_private: false, sort_order: 1, content: "suggest replacing olive oil with canola oil"  

Twist.create! recipe_id: 1, user_id: 1, tags: "ingredient addition", slug: "siaodhafh72", is_private: false, sort_order: 2, content: "suggest adding curry powder"

# Twist.create! recipe_id: 52882, user_id: 1, tags: "ingredient substitution", slug: "dsyf2nfhwf", is_private: false, sort_order: 1, content: "suggest replacing salmon with rowe"

puts "DONE!"
