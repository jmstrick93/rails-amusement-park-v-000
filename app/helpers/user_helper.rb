module UserHelper
  def show_if_admin(user)
    if user.admin
      content_tag(:p, content_tag(:em, '--ADMIN--'))
    end
  end

  # def logout_button
  #   if session[:user_id]
  #     link_to "Log Out", logout_path
  #   end
  # end
end
