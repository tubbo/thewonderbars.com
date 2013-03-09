module ReleasesHelper
  # Render release format from Markdown.
  def markdown source
    redcarpet = Redcarpet::Markdown.new Redcarpet::Render::HTML, autolink: true
    redcarpet.render(source).html_safe
  end
end
