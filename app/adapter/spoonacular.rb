module Spoonacular 

	class Adapter 
      
      api_key= "1db71ee7d7c649df9d683bc883616a81"

      #Base_URL ="https://api.spoonacular.com/recipes/complexSearch?query=pasta&apiKey=#{api_key}"
     Base_URL= "https://api.spoonacular.com/recipes/complexSearch?query=pasta&cuisine=italian&number=50&fillIngredients=true&apiKey=#{api_key}"

    def fetch_recipes 

      	recipes = JSON.parse(RestClient.get(Base_URL))
        
        recipes["results"].each do |recipe| 

      		

        @recipe = Recipe.new( title: recipe["title"], image: recipe["image"])

          

         #ingredient = recipe["missedIngredients"].each do |ingredient| 

        	#@ingredient= Ingredient.find_or_create_by(name: ingredient["name"] ,image: ingredient["image"])

        	   #@recipe.ingredient << @ingredient

        	    #binding.pry
        	   @recipe.save 
        	 
             #end 
           end 
      	end 
	   end 

end 