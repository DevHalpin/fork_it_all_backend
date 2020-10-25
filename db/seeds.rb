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
  User.create! email: email, profile_picture: profile_picture, handle: username
end

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