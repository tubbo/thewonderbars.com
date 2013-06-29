# The official discography of The Wonder Bars.
class ReleasesController < ApplicationController
  caches_action :index

  # Return all releases
  def index
    @releases = Release.where(search_filters).decorate_collection
    render layout: false if request.xhr?
  end

  # Return a single release by ID
  def show
    @release = Release.find(params[:id]).decorate
    render layout: false if request.xhr?
  end

private
  def search_filters
    params.permit(:name, :catalog_number, :released_on)
  end
end

