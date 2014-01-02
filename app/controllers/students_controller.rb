class StudentsController < ApplicationController

  before_filter :check_admin, only: [:new, :create, :destroy]

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(params[:student])
    if @student.save
      redirect_to root_path, flash: { notice: "You've registered a student!"}
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