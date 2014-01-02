class SessionsController < ApplicationController
  before_filter :already_signed_in, only: [:new, :create]
  
  def new
    @admin = params[:user] == "admin"
  end

  def create
    if params[:user] == "admin"
      admin = Admin.find_by_student_id(params[:session][:student_id])
      verify_password = admin.authenticate(params[:session][:password])
      verify_birthdate = admin.birthdate == params[:session][:birthdate]
      if admin && verify_birthdate && verify_password
        sign_in admin
        flash[:notice] = "You have signed in!"
        redirect_to root_path
      else
        flash[:error] = "Wrong sign in information"
        redirect_to signin_path(user: "admin")
      end
    elsif params[:user] == "student"
      student = Student.find_by_student_id(params[:session][:student_id])
      if student && student.authenticate(params[:session][:password])
        sign_in student
        flash[:notice] = "You have signed in!"
        redirect_to root_path
      else
        flash[:error] = "Invalid Student ID or Birthday"
        redirect_to signin_path(user: params[:user])
      end
    else
      redirect_to root_path
    end
  end

  def destroy
    sign_out
    flash[:notice] = "You've signed out!"
    redirect_to root_path
  end

  private

    def already_signed_in
      unless !signed_in?
        flash[:error] = "You've signed in already!" 
        redirect_to root_path
      end
    end

end
