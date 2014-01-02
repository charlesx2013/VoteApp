class CandidatesController < ApplicationController

  before_filter :check_admin, only: [:new, :create, :destroy]

  def new
    @candidate = Candidate.new
    @positions = Position.all
    @choices = []
    @positions.each do |pos|
      @choices.push "#{pos.name}(#{pos.position_type})"
    end
    session[:choices] = @choices  
  end

  def create
    @candidate = Candidate.new(params[:candidate])
    if @candidate.save
      redirect_to root_path, flash: { notice: "You've registered a candidate!"}
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
