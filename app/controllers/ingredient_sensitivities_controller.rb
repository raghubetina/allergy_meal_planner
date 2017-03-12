class IngredientSensitivitiesController < ApplicationController
  def index
    @ingredient_sensitivities = IngredientSensitivity.page(params[:page]).per(10)

    render("ingredient_sensitivities/index.html.erb")
  end

  def show
    @ingredient_sensitivity = IngredientSensitivity.find(params[:id])

    render("ingredient_sensitivities/show.html.erb")
  end

  def new
    @ingredient_sensitivity = IngredientSensitivity.new

    render("ingredient_sensitivities/new.html.erb")
  end

  def create
    @ingredient_sensitivity = IngredientSensitivity.new

    @ingredient_sensitivity.ingredient_id = params[:ingredient_id]
    @ingredient_sensitivity.sensitivity_id = params[:sensitivity_id]

    save_status = @ingredient_sensitivity.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/ingredient_sensitivities/new", "/create_ingredient_sensitivity"
        redirect_to("/ingredient_sensitivities")
      else
        redirect_back(:fallback_location => "/", :notice => "Ingredient sensitivity created successfully.")
      end
    else
      render("ingredient_sensitivities/new.html.erb")
    end
  end

  def edit
    @ingredient_sensitivity = IngredientSensitivity.find(params[:id])

    render("ingredient_sensitivities/edit.html.erb")
  end

  def update
    @ingredient_sensitivity = IngredientSensitivity.find(params[:id])

    @ingredient_sensitivity.ingredient_id = params[:ingredient_id]
    @ingredient_sensitivity.sensitivity_id = params[:sensitivity_id]

    save_status = @ingredient_sensitivity.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/ingredient_sensitivities/#{@ingredient_sensitivity.id}/edit", "/update_ingredient_sensitivity"
        redirect_to("/ingredient_sensitivities/#{@ingredient_sensitivity.id}", :notice => "Ingredient sensitivity updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Ingredient sensitivity updated successfully.")
      end
    else
      render("ingredient_sensitivities/edit.html.erb")
    end
  end

  def destroy
    @ingredient_sensitivity = IngredientSensitivity.find(params[:id])

    @ingredient_sensitivity.destroy

    if URI(request.referer).path == "/ingredient_sensitivities/#{@ingredient_sensitivity.id}"
      redirect_to("/", :notice => "Ingredient sensitivity deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Ingredient sensitivity deleted.")
    end
  end
end
