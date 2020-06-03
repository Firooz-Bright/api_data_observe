class RecipesControllers < ApplicationController


	#CREATE 

    get'/recipes/new' do 
     erb :new 
    end 
    
    post'/recipes' do 
    	
    	@recipes=Recipe.create(params)
    	
    if 	!@recipes.title.empty? && !@recipes.method.empty?
         @recipes.save 
    	
       redirect '/recipes' #take the user to the recipes index page 

      else 
          @error ="Data Invalid Please Enter a Valid Data"
      	  erb :new              #rerender the form 
     end 
    end 


	#READ

    get'/recipes' do 
      
      @recipes = Recipe.all
      erb :index   
    end 


   get '/recipes/:id'  do 

   	 @recipe= Recipe.find(params[:id])

    erb :show
   end 


	#UPDATE 

 get '/recipes/:id/edit'  do 
    
  @recipe=Recipe.find(params[:id])

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