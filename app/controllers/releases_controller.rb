# The official discography of The Wonder Bars.
class ReleasesController < ApplicationController
  # Return all releases
  def index
    @releases = []
    render layout: false if request.xhr?
  end

  # Return a single release by ID
  def show
    @release = Release.find params[:id]
    render layout: false if request.xhr?
  end
end

