# A client for the Facebook Graph API which looks for data on a specific Facebook page or profile. It
# reads from the YAML configuration stored in `config/facebook.yml` for the current Rails environment.
class FacebookClient
  attr_reader :graph, :page, :oauth, :config

  # Connects to the open graph.
  def initialize options={}
    @oauth = Koala::Facebook::OAuth.new
    @graph = Koala::Facebook::API.new access_token
    @page = @graph.get_object(Facebook::PAGE_ID)
  end

  # Shows the 'about' attribute from the Facebook page.
  def bio
    @page['bio']
  end

  # Tests if the Facebook client has in fact connected to Facebook
  def connected?
    true
  end

  # Gets any attribute from Facebook, as long as it's within the filter, and returns it.
  def method_missing attribute
    if @page.present?
      if @page[:"#{attribute}"].present?
        @page[:"#{attribute}"]
      else
        raise AttributeNotFound
      end
    else
      raise PageNotFound
    end
  end

  private

  def access_token
    @oauth.get_app_access_token
  end

  # Thrown when the Facebook page doesn't have the attribute requested.
  class AttributeNotFound < StandardError; end

  # Thrown when the Facebook page can't be found
  class PageNotFound < StandardError; end
end
