# Includes static content exclusive to this site. If we need it.
class PagesController < ApplicationController
  caches_page :index, :shows

  def index
    render layout: false if request.xhr?
  end

  def shows
    render layout: false if request.xhr?
  end
end
