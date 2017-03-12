class CookbookMealsController < ApplicationController
  def index
    @cookbook_meals = CookbookMeal.page(params[:page]).per(10)

    render("cookbook_meals/index.html.erb")
  end

  def show
    @cookbook_meal = CookbookMeal.find(params[:id])

    render("cookbook_meals/show.html.erb")
  end

  def new
    @cookbook_meal = CookbookMeal.new

    render("cookbook_meals/new.html.erb")
  end

  def create
    @cookbook_meal = CookbookMeal.new

    @cookbook_meal.cookbook_id = params[:cookbook_id]
    @cookbook_meal.meal_id = params[:meal_id]

    save_status = @cookbook_meal.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/cookbook_meals/new", "/create_cookbook_meal"
        redirect_to("/cookbook_meals")
      else
        redirect_back(:fallback_location => "/", :notice => "Cookbook meal created successfully.")
      end
    else
      render("cookbook_meals/new.html.erb")
    end
  end

  def edit
    @cookbook_meal = CookbookMeal.find(params[:id])

    render("cookbook_meals/edit.html.erb")
  end

  def update
    @cookbook_meal = CookbookMeal.find(params[:id])

    @cookbook_meal.cookbook_id = params[:cookbook_id]
    @cookbook_meal.meal_id = params[:meal_id]

    save_status = @cookbook_meal.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/cookbook_meals/#{@cookbook_meal.id}/edit", "/update_cookbook_meal"
        redirect_to("/cookbook_meals/#{@cookbook_meal.id}", :notice => "Cookbook meal updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Cookbook meal updated successfully.")
      end
    else
      render("cookbook_meals/edit.html.erb")
    end
  end

  def destroy
    @cookbook_meal = CookbookMeal.find(params[:id])

    @cookbook_meal.destroy

    if URI(request.referer).path == "/cookbook_meals/#{@cookbook_meal.id}"
      redirect_to("/", :notice => "Cookbook meal deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Cookbook meal deleted.")
    end
  end
end
