class MealRecipesController < ApplicationController
  def index
    @meal_recipes = MealRecipe.page(params[:page]).per(10)

    render("meal_recipes/index.html.erb")
  end

  def show
    @meal_recipe = MealRecipe.find(params[:id])

    render("meal_recipes/show.html.erb")
  end

  def new
    @meal_recipe = MealRecipe.new

    render("meal_recipes/new.html.erb")
  end

  def create
    @meal_recipe = MealRecipe.new

    @meal_recipe.meal_id = params[:meal_id]
    @meal_recipe.recipe_id = params[:recipe_id]

    save_status = @meal_recipe.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/meal_recipes/new", "/create_meal_recipe"
        redirect_to("/meal_recipes")
      else
        redirect_back(:fallback_location => "/", :notice => "Meal recipe created successfully.")
      end
    else
      render("meal_recipes/new.html.erb")
    end
  end

  def edit
    @meal_recipe = MealRecipe.find(params[:id])

    render("meal_recipes/edit.html.erb")
  end

  def update
    @meal_recipe = MealRecipe.find(params[:id])

    @meal_recipe.meal_id = params[:meal_id]
    @meal_recipe.recipe_id = params[:recipe_id]

    save_status = @meal_recipe.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/meal_recipes/#{@meal_recipe.id}/edit", "/update_meal_recipe"
        redirect_to("/meal_recipes/#{@meal_recipe.id}", :notice => "Meal recipe updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Meal recipe updated successfully.")
      end
    else
      render("meal_recipes/edit.html.erb")
    end
  end

  def destroy
    @meal_recipe = MealRecipe.find(params[:id])

    @meal_recipe.destroy

    if URI(request.referer).path == "/meal_recipes/#{@meal_recipe.id}"
      redirect_to("/", :notice => "Meal recipe deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Meal recipe deleted.")
    end
  end
end
