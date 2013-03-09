module PluginsHelper
  def meta_description_from_facebook
    facebook = Facebook::Client.new
    tag :meta, content: facebook.description, name: "description"
  end

  def google_analytics_id
    ENV['GOOGLE_ANALYTICS_ID']
  end

  def facebook_app_id
    ENV['FB_APP_ID']
  end
end
