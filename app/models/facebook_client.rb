# A client for the Facebook graph API which looks for data on a specific Facebook page or profile. It
# reads from a YAML config or passed in options and
class FacebookClient
  # Connects to the open graph.
  def initialize options={}
    @config = YAML.load_file(options[:config_file] || Facebook::CONFIG)[options[:environment] || Rails.env]
    @graph = Koala::Facebook::API.new(access_token)
    @page = @graph.get_object(@config[:page_id])
    @oauth = Koala::Facebook::OAuth.new(@config[:app_id], @config[:app_secret], @config[:callback_url])
  end

  # Shows the 'about' attribute from the Facebook page.
  def about
    @graph.get_object(@config[:page_id]).send :about
  end

  # Generates an OAuth access token.
  def access_token
    @oauth.get_app_access_token
  end

  # Tests if the Facebook client has in fact connected to Facebook
  def connected?
    @graph.connected?
  end

  # Gets any attribute from Facebook, as long as it's within the filter, and returns it.
  def method_missing attribute
    if @page.responds_to? :"#{attribute}"
      @page.send attribute.to_sym
    else
      raise AttributeNotFound
    end
  end

  # Thrown when the Facebook page doesn't have the attribute requested.
  class AttributeNotFound < StandardError; end
end
