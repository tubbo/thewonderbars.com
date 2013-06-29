# The official discography of The Wonder Bars.
class ReleasesController < ApplicationController
  caches_page :index

  # Return all releases
  def index
    @releases = Release.all.decorate_collection
    render layout: false if request.xhr?
  end

  # Return a single release by ID
  def show
    @release = Release.find(params[:id]).decorate
    render layout: false if request.xhr?
  end
end

