class RecipeIngredientsController < ApplicationController
  def index
    @recipe_ingredients = RecipeIngredient.all

    render("recipe_ingredients/index.html.erb")
  end

  def show
    @recipe_ingredient = RecipeIngredient.find(params[:id])

    render("recipe_ingredients/show.html.erb")
  end

  def new
    @recipe_ingredient = RecipeIngredient.new

    render("recipe_ingredients/new.html.erb")
  end

  def create
    @recipe_ingredient = RecipeIngredient.new

    @recipe_ingredient.recipe_id = params[:recipe_id]
    @recipe_ingredient.ingredient_id = params[:ingredient_id]
    @recipe_ingredient.measurement = params[:measurement]

    save_status = @recipe_ingredient.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/recipe_ingredients/new", "/create_recipe_ingredient"
        redirect_to("/recipe_ingredients")
      else
        redirect_back(:fallback_location => "/", :notice => "Recipe ingredient created successfully.")
      end
    else
      render("recipe_ingredients/new.html.erb")
    end
  end

  def edit
    @recipe_ingredient = RecipeIngredient.find(params[:id])

    render("recipe_ingredients/edit.html.erb")
  end

  def update
    @recipe_ingredient = RecipeIngredient.find(params[:id])

    @recipe_ingredient.recipe_id = params[:recipe_id]
    @recipe_ingredient.ingredient_id = params[:ingredient_id]
    @recipe_ingredient.measurement = params[:measurement]

    save_status = @recipe_ingredient.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/recipe_ingredients/#{@recipe_ingredient.id}/edit", "/update_recipe_ingredient"
        redirect_to("/recipe_ingredients/#{@recipe_ingredient.id}", :notice => "Recipe ingredient updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Recipe ingredient updated successfully.")
      end
    else
      render("recipe_ingredients/edit.html.erb")
    end
  end

  def destroy
    @recipe_ingredient = RecipeIngredient.find(params[:id])

    @recipe_ingredient.destroy

    if URI(request.referer).path == "/recipe_ingredients/#{@recipe_ingredient.id}"
      redirect_to("/", :notice => "Recipe ingredient deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Recipe ingredient deleted.")
    end
  end
end
