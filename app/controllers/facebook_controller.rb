class FacebookController < Facebook::PageController
  # Accesses 'about', 'description' and 'bio' for a complete "About Us" page.
  def about_us
    @tagline = facebook.about
    @elevator_pitch = facebook.description
    @long_form_bio = facebook.bio
    render layout: false if request.xhr?
  end

  # Accesses some basic contact information
  def contact
    @management_email = facebook.general_manager
    @booking_email = facebook.booking_agent
    render layout: false if request.xhr?
  end
end
