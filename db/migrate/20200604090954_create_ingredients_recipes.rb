class CreateIngredientsRecipes < ActiveRecord::Migration
  def change
  	create_join_table :ingredients,:recipes do |t|
      t.integer :ingredient_id
      t.integer :recipe_id 
    end
  end
end 
