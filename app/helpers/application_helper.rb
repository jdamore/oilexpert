module ApplicationHelper

  def app_title
    'OilExpert.com'
  end

  def user_in_session
    User.find_by_name session[:user_name]
  end

end
