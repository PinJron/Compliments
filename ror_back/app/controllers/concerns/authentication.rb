module Authentication
  def current_user
    @current_user ||= User.find_by_id session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def admin?
    current_user&.admin?
  end

  def authorize_user!
    respond_with_error(:error_you_are_not_logged_in) unless logged_in?
  end

  def authorize_admin!
    respond_with_error(:error_access_not_allowed) unless admin?
  end
end
