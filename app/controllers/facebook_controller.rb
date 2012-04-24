# Grabs attributes from the Facebook page and displays them. You may optionally define custom actions
# here which get multiple data sources.
class FacebookController < ApplicationController
  # Gets any attribute from the Facebook page and displays it in the page_attribute template.
  def method_missing attribute
    if facebook.has_attribute? attribute_name
      @page_attribute = facebook.send attribute
      render partial: 'page_attribute', locals: { attribute: @page_attribute }
    else
      render partial: 'attribute_not_found', locals: { attribute_name: "#{attribute}" }
    end
  end

  # Accesses 'about', 'description' and 'bio' for a complete "About Us" page.
  def about_us
    @tagline = facebook.about
    @elevator_pitch = facebook.description
    @long_form_bio = facebook.bio
  end
end
