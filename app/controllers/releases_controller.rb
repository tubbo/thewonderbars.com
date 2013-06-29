# The official discography of The Wonder Bars.
class ReleasesController < ApplicationController
  caches_action :index

  # Return all releases
  def index
    @releases = Release.all
    render layout: false if request.xhr?
  end

  # Return a single release by ID
  def show
    @release = Release.find params[:id]
    render 'missing', status: 404 and return unless @release.present?
    render layout: false if request.xhr?
  end
end

