class AdminsController < ApplicationController
  before_filter :check_valid_user, only: [:edit, :update]
  before_filter :check_admin, only: [:new, :create, :edit, :update, :results] 

  def results
    @position_asb = Position.where position_type: "asb"
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(params[:admin])
    if @admin.save
      redirect_to root_path, flash: { notice: "You've created a new admin!"}
    else 
      render 'new'
    end
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def update
    @admin = Admin.find(params[:id])
    if @admin.update_attributes(params[:admin])
      flash[:notice] = "Your information has been updated!"
      sign_in @admin
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private

    def check_valid_user
      admin = Admin.find(params[:id])
      redirect_to(root_path) and flash[:error] = "Invalid User" unless correct_user?(admin)
    end

    def check_admin
      redirect_to(root_path) and flash[:error] = "Invalid User" unless admin?
    end

end
