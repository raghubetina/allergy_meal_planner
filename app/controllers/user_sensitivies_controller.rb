class UserSensitiviesController < ApplicationController
  before_action :current_user_must_be_user_sensitivy_user, :only => [:show, :edit, :update, :destroy]

  def current_user_must_be_user_sensitivy_user
    user_sensitivy = UserSensitivy.find(params[:id])

    unless current_user == user_sensitivy.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = current_user.user_sensitivies.ransack(params[:q])
      @user_sensitivies = @q.result(:distinct => true).includes(:sensitivity, :user, :cookbooks).page(params[:page]).per(10)

    render("user_sensitivies/index.html.erb")
  end

  def show
    @cookbook = Cookbook.new
    @user_sensitivy = UserSensitivy.find(params[:id])

    render("user_sensitivies/show.html.erb")
  end

  def new
    @user_sensitivy = UserSensitivy.new

    render("user_sensitivies/new.html.erb")
  end

  def create
    @user_sensitivy = UserSensitivy.new

    @user_sensitivy.user_id = params[:user_id]
    @user_sensitivy.sensitivity_id = params[:sensitivity_id]

    save_status = @user_sensitivy.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/user_sensitivies/new", "/create_user_sensitivy"
        redirect_to("/user_sensitivies")
      else
        redirect_back(:fallback_location => "/", :notice => "User sensitivy created successfully.")
      end
    else
      render("user_sensitivies/new.html.erb")
    end
  end

  def edit
    @user_sensitivy = UserSensitivy.find(params[:id])

    render("user_sensitivies/edit.html.erb")
  end

  def update
    @user_sensitivy = UserSensitivy.find(params[:id])
    @user_sensitivy.sensitivity_id = params[:sensitivity_id]

    save_status = @user_sensitivy.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/user_sensitivies/#{@user_sensitivy.id}/edit", "/update_user_sensitivy"
        redirect_to("/user_sensitivies/#{@user_sensitivy.id}", :notice => "User sensitivy updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "User sensitivy updated successfully.")
      end
    else
      render("user_sensitivies/edit.html.erb")
    end
  end

  def destroy
    @user_sensitivy = UserSensitivy.find(params[:id])

    @user_sensitivy.destroy

    if URI(request.referer).path == "/user_sensitivies/#{@user_sensitivy.id}"
      redirect_to("/", :notice => "User sensitivy deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "User sensitivy deleted.")
    end
  end
end
