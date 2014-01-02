class ApplicationController < ActionController::Base
  include SessionsHelper
  include ApplicationHelper
  protect_from_forgery

  def handle_unverified_requeset
    sign_out
    super
  end
end
