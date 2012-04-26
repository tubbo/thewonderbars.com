class ApplicationController < ActionController::Base
  protect_from_forgery

  # Shorthand accessor for the omnipresent Facebook client
  def facebook
    @facebook_client ||= FacebookClient.new
  end
end
