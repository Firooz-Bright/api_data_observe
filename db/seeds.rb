Recipe.destroy_all

puts "seeding databas "

Spoonacular::Adapter.new.fetch_recipes 

puts"done" 