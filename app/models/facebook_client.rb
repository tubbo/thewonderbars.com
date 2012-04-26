# A client for the Facebook graph API which looks for data on a specific Facebook page or profile. It
# reads from a YAML config or passed in options and
class FacebookClient
  attr_reader :graph, :page, :oauth

  # Connects to the open graph.
  def initialize options={}
    @config = Facebook::CONFIG # [TODO] DECOUPLE!!
    @oauth = Koala::Facebook::OAuth.new(client_id: @config[:app_id], client_secret: @config[:secret_key])
    @graph = Koala::Facebook::API.new \
      app_id: @config[:app_id],
      app_secret: @config[:secret_key],
      access_token: @oauth.get_app_access_token #"109898403861|DGdiK3tay_jZnHKYPqPBeU2fkRA"
    @page = @graph.get_object(@config[:page_id])
  end

  # Shows the 'about' attribute from the Facebook page.
  def about
    @graph.get_object(@config[:page_id]).send :about
  end

  # Tests if the Facebook client has in fact connected to Facebook
  def connected?
    true
  end

  # Gets any attribute from Facebook, as long as it's within the filter, and returns it.
  def method_missing attribute
    if @page.present?
      if @page.responds_to? :"#{attribute}"
        @page.send :"#{attribute}"
      else
        raise AttributeNotFound
      end
    else
      raise PageNotFound
    end
  end

  # Thrown when the Facebook page doesn't have the attribute requested.
  class AttributeNotFound < StandardError; end

  # Thrown when the Facebook page can't be found
  class PageNotFound < StandardError; end
end
