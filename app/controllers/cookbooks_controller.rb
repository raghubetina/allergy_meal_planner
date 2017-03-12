class CookbooksController < ApplicationController
  def index
    @cookbooks = Cookbook.all

    render("cookbooks/index.html.erb")
  end

  def show
    @cookbook = Cookbook.find(params[:id])

    render("cookbooks/show.html.erb")
  end

  def new
    @cookbook = Cookbook.new

    render("cookbooks/new.html.erb")
  end

  def create
    @cookbook = Cookbook.new

    @cookbook.user_id = params[:user_id]
    @cookbook.name = params[:name]

    save_status = @cookbook.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/cookbooks/new", "/create_cookbook"
        redirect_to("/cookbooks")
      else
        redirect_back(:fallback_location => "/", :notice => "Cookbook created successfully.")
      end
    else
      render("cookbooks/new.html.erb")
    end
  end

  def edit
    @cookbook = Cookbook.find(params[:id])

    render("cookbooks/edit.html.erb")
  end

  def update
    @cookbook = Cookbook.find(params[:id])

    @cookbook.user_id = params[:user_id]
    @cookbook.name = params[:name]

    save_status = @cookbook.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/cookbooks/#{@cookbook.id}/edit", "/update_cookbook"
        redirect_to("/cookbooks/#{@cookbook.id}", :notice => "Cookbook updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Cookbook updated successfully.")
      end
    else
      render("cookbooks/edit.html.erb")
    end
  end

  def destroy
    @cookbook = Cookbook.find(params[:id])

    @cookbook.destroy

    if URI(request.referer).path == "/cookbooks/#{@cookbook.id}"
      redirect_to("/", :notice => "Cookbook deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Cookbook deleted.")
    end
  end
end
