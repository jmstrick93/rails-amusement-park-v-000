module ApplicationHelper

  def display_flash_messages
    render partial: 'layouts/flash', :locals => {flash: flash}
  end

end
