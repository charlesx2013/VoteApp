module SessionsHelper

  def sign_in(user)
    cookies[:remember_token] = { value: user.remember_token, 
                                           expires: 30.minutes.from_now.utc }
    self.current_user = user
  end

  def signed_in?
    !current_user.nil?
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end  

  def signed_in_user?
    unless signed_in?
      redirect_to root_path
      flash[:notice] = "You aren't signed in yet!"
    end
  end

  def correct_user?(user)
    current_user == user
  end

  def signed_in_student?
    signed_in? && !admin?
  end

  def signed_in_admin?
    signed_in? && admin?
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    student = Student.find_by_remember_token(cookies[:remember_token])
    admin = Admin.find_by_remember_token(cookies[:remember_token])
    @current_user ||= student ||= admin 
  end


end
