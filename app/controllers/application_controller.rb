class ApplicationController < ActionController::Base
  protect_from_forgery

  # Shorthand accessor for the facebook client
  def facebook
    FacebookClient.new
  end
end
