class PositionsController < ApplicationController

  before_filter :check_admin, only: [:new, :create, :destroy]

  def new
    @position = Position.new
  end

  def create
    @position = Position.new(params[:position])
    if @position.save
      redirect_to root_path, flash: { notice: "You've created a new position!"}
    else
      render 'new'
    end
  end

  def destroy
  end

  private

    def check_admin
      redirect_to root_path, flash: { notice: "Invalid User"} unless admin?
    end

end
