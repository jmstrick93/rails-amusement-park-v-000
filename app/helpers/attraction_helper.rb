module AttractionHelper

  def new_attraction_link(user)
    if user.admin
      content_tag(:p, content_tag(:em, link_to("New Attraction", new_attraction_path)))
    end
  end

  def view_attraction_link(user, attraction)
    if user.admin
      content_tag(:p, link_to("Show #{attraction.name}", attraction_path(attraction)))
    else
      content_tag(:p, link_to("Go on #{attraction.name}", attraction_path(attraction)))
    end
  end

  #next time, make a "admin_wrap" method that uses yield

  def view_edit_link(user, attraction)
    if user.admin
      content_tag(:p, link_to("Edit Attraction", edit_attraction_path(attraction)))
    end
  end

end
