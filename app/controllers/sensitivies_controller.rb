class SensitiviesController < ApplicationController
  def index
    @sensitivies = Sensitivy.page(params[:page]).per(10)

    render("sensitivies/index.html.erb")
  end

  def show
    @ingredient_sensitivity = IngredientSensitivity.new
    @user_sensitivy = UserSensitivy.new
    @sensitivy = Sensitivy.find(params[:id])

    render("sensitivies/show.html.erb")
  end

  def new
    @sensitivy = Sensitivy.new

    render("sensitivies/new.html.erb")
  end

  def create
    @sensitivy = Sensitivy.new

    @sensitivy.name = params[:name]

    save_status = @sensitivy.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/sensitivies/new", "/create_sensitivy"
        redirect_to("/sensitivies")
      else
        redirect_back(:fallback_location => "/", :notice => "Sensitivy created successfully.")
      end
    else
      render("sensitivies/new.html.erb")
    end
  end

  def edit
    @sensitivy = Sensitivy.find(params[:id])

    render("sensitivies/edit.html.erb")
  end

  def update
    @sensitivy = Sensitivy.find(params[:id])

    @sensitivy.name = params[:name]

    save_status = @sensitivy.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/sensitivies/#{@sensitivy.id}/edit", "/update_sensitivy"
        redirect_to("/sensitivies/#{@sensitivy.id}", :notice => "Sensitivy updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Sensitivy updated successfully.")
      end
    else
      render("sensitivies/edit.html.erb")
    end
  end

  def destroy
    @sensitivy = Sensitivy.find(params[:id])

    @sensitivy.destroy

    if URI(request.referer).path == "/sensitivies/#{@sensitivy.id}"
      redirect_to("/", :notice => "Sensitivy deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Sensitivy deleted.")
    end
  end
end
