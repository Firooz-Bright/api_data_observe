Recipe.destroy_all
Ingredient.destroy_all

puts "seeding databas "

Spoonacular::Adapter.new.fetch_recipes 

puts"Database is seeded" 