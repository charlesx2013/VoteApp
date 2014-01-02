module ApplicationHelper
  def asb?
    current_user.grade.to_i > 8 && !current_user.asb_vote?
  end

  def class?
    !current_user.class_vote?
  end

  def neither?
    current_user.class_vote? && current_user.asb_vote?
  end 

  def admin?
    current_user.class.name == "Admin"
  end

  def underclass?
    current_user.grade.to_i <= 8 
  end
end
