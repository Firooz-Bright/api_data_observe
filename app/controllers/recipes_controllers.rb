class RecipesControllers < ApplicationController

	#CREATE 

#before do 
  #require_login 
#end 

    get'/recipes/new' do 
       @ingredients = Ingredient.all
       erb :new                                # if logged_in?
    end                                        #erb :new 
                                              #else 
                                              #redirect '/login'
                                              #end 
    
    
    post'/recipes' do 
       
    	 @recipe= current_user.recipes.build(params["recipe"])
    	
       if ingredient= Ingredient.find_by(name: params["ingredient"]["name"])
        @recipe.ingredients << ingredient

      else 
         @recipe.ingredients.build(params["ingredient"])
      end 

     if 	               #!@recipes.title.empty? && !@recipes.method.empty? # we did the validation 
         @recipe.save 
    	
       redirect '/recipes' 

      else 
          @error ="Data Invalid Please Enter a Valid Data"
      	  erb :new              
     end 
    end 


	#READ

    get'/recipes' do 
      require_login 
      @recipes = Recipe.all.reverse 
      erb :index 
     
   end 


   get '/recipes/:id'  do 
    
   	 @recipe= Recipe.find_by(id: params[:id])
     if @recipe 
       erb :show
     else 
      redirect '/recipes'
     end 
   end 


	#UPDATE 

 get '/recipes/:id/edit'  do 
  
   @recipe= Recipe.find(params[:id])
   erb :edit 
end 


patch '/recipes/:id' do 
    
   @recipe= Recipe.find(params[:id])
  
 
  if  !params['recipe']['title'].empty? && !params['recipe']['method'].empty?

      @recipe.update(params['recipe'])

      redirect "/recipes/ #{params[:id]}"

      else 
          @error ="Data Invalid Please Enter a Valid Data"
          erb :edit             #rerender the form 
      end 
end 

	 delete'/recipes/:id'  do 
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect '/recipes'
   end #DESTROY 

end 