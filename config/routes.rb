Rails.application.routes.draw do
  # Routes for the Cookbook_meal resource:
  # CREATE
  get "/cookbook_meals/new", :controller => "cookbook_meals", :action => "new"
  post "/create_cookbook_meal", :controller => "cookbook_meals", :action => "create"

  # READ
  get "/cookbook_meals", :controller => "cookbook_meals", :action => "index"
  get "/cookbook_meals/:id", :controller => "cookbook_meals", :action => "show"

  # UPDATE
  get "/cookbook_meals/:id/edit", :controller => "cookbook_meals", :action => "edit"
  post "/update_cookbook_meal/:id", :controller => "cookbook_meals", :action => "update"

  # DELETE
  get "/delete_cookbook_meal/:id", :controller => "cookbook_meals", :action => "destroy"
  #------------------------------

  # Routes for the Cookbook resource:
  # CREATE
  get "/cookbooks/new", :controller => "cookbooks", :action => "new"
  post "/create_cookbook", :controller => "cookbooks", :action => "create"

  # READ
  get "/cookbooks", :controller => "cookbooks", :action => "index"
  get "/cookbooks/:id", :controller => "cookbooks", :action => "show"

  # UPDATE
  get "/cookbooks/:id/edit", :controller => "cookbooks", :action => "edit"
  post "/update_cookbook/:id", :controller => "cookbooks", :action => "update"

  # DELETE
  get "/delete_cookbook/:id", :controller => "cookbooks", :action => "destroy"
  #------------------------------

  # Routes for the Ingredient_sensitivity resource:
  # CREATE
  get "/ingredient_sensitivities/new", :controller => "ingredient_sensitivities", :action => "new"
  post "/create_ingredient_sensitivity", :controller => "ingredient_sensitivities", :action => "create"

  # READ
  get "/ingredient_sensitivities", :controller => "ingredient_sensitivities", :action => "index"
  get "/ingredient_sensitivities/:id", :controller => "ingredient_sensitivities", :action => "show"

  # UPDATE
  get "/ingredient_sensitivities/:id/edit", :controller => "ingredient_sensitivities", :action => "edit"
  post "/update_ingredient_sensitivity/:id", :controller => "ingredient_sensitivities", :action => "update"

  # DELETE
  get "/delete_ingredient_sensitivity/:id", :controller => "ingredient_sensitivities", :action => "destroy"
  #------------------------------

  # Routes for the User_sensitivy resource:
  # CREATE
  get "/user_sensitivies/new", :controller => "user_sensitivies", :action => "new"
  post "/create_user_sensitivy", :controller => "user_sensitivies", :action => "create"

  # READ
  get "/user_sensitivies", :controller => "user_sensitivies", :action => "index"
  get "/user_sensitivies/:id", :controller => "user_sensitivies", :action => "show"

  # UPDATE
  get "/user_sensitivies/:id/edit", :controller => "user_sensitivies", :action => "edit"
  post "/update_user_sensitivy/:id", :controller => "user_sensitivies", :action => "update"

  # DELETE
  get "/delete_user_sensitivy/:id", :controller => "user_sensitivies", :action => "destroy"
  #------------------------------

  # Routes for the Recipe_ingredient resource:
  # CREATE
  get "/recipe_ingredients/new", :controller => "recipe_ingredients", :action => "new"
  post "/create_recipe_ingredient", :controller => "recipe_ingredients", :action => "create"

  # READ
  get "/recipe_ingredients", :controller => "recipe_ingredients", :action => "index"
  get "/recipe_ingredients/:id", :controller => "recipe_ingredients", :action => "show"

  # UPDATE
  get "/recipe_ingredients/:id/edit", :controller => "recipe_ingredients", :action => "edit"
  post "/update_recipe_ingredient/:id", :controller => "recipe_ingredients", :action => "update"

  # DELETE
  get "/delete_recipe_ingredient/:id", :controller => "recipe_ingredients", :action => "destroy"
  #------------------------------

  # Routes for the Meal_recipe resource:
  # CREATE
  get "/meal_recipes/new", :controller => "meal_recipes", :action => "new"
  post "/create_meal_recipe", :controller => "meal_recipes", :action => "create"

  # READ
  get "/meal_recipes", :controller => "meal_recipes", :action => "index"
  get "/meal_recipes/:id", :controller => "meal_recipes", :action => "show"

  # UPDATE
  get "/meal_recipes/:id/edit", :controller => "meal_recipes", :action => "edit"
  post "/update_meal_recipe/:id", :controller => "meal_recipes", :action => "update"

  # DELETE
  get "/delete_meal_recipe/:id", :controller => "meal_recipes", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # Routes for the Sensitivy resource:
  # CREATE
  get "/sensitivies/new", :controller => "sensitivies", :action => "new"
  post "/create_sensitivy", :controller => "sensitivies", :action => "create"

  # READ
  get "/sensitivies", :controller => "sensitivies", :action => "index"
  get "/sensitivies/:id", :controller => "sensitivies", :action => "show"

  # UPDATE
  get "/sensitivies/:id/edit", :controller => "sensitivies", :action => "edit"
  post "/update_sensitivy/:id", :controller => "sensitivies", :action => "update"

  # DELETE
  get "/delete_sensitivy/:id", :controller => "sensitivies", :action => "destroy"
  #------------------------------

  # Routes for the Ingredient resource:
  # CREATE
  get "/ingredients/new", :controller => "ingredients", :action => "new"
  post "/create_ingredient", :controller => "ingredients", :action => "create"

  # READ
  get "/ingredients", :controller => "ingredients", :action => "index"
  get "/ingredients/:id", :controller => "ingredients", :action => "show"

  # UPDATE
  get "/ingredients/:id/edit", :controller => "ingredients", :action => "edit"
  post "/update_ingredient/:id", :controller => "ingredients", :action => "update"

  # DELETE
  get "/delete_ingredient/:id", :controller => "ingredients", :action => "destroy"
  #------------------------------

  # Routes for the Recipe resource:
  # CREATE
  get "/recipes/new", :controller => "recipes", :action => "new"
  post "/create_recipe", :controller => "recipes", :action => "create"

  # READ
  get "/recipes", :controller => "recipes", :action => "index"
  get "/recipes/:id", :controller => "recipes", :action => "show"

  # UPDATE
  get "/recipes/:id/edit", :controller => "recipes", :action => "edit"
  post "/update_recipe/:id", :controller => "recipes", :action => "update"

  # DELETE
  get "/delete_recipe/:id", :controller => "recipes", :action => "destroy"
  #------------------------------

  # Routes for the Meal resource:
  # CREATE
  get "/meals/new", :controller => "meals", :action => "new"
  post "/create_meal", :controller => "meals", :action => "create"

  # READ
  get "/meals", :controller => "meals", :action => "index"
  get "/meals/:id", :controller => "meals", :action => "show"

  # UPDATE
  get "/meals/:id/edit", :controller => "meals", :action => "edit"
  post "/update_meal/:id", :controller => "meals", :action => "update"

  # DELETE
  get "/delete_meal/:id", :controller => "meals", :action => "destroy"
  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
