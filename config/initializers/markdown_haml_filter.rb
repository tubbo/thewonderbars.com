module Haml::Filters::Markdown
  include Haml::Filters::Base
  lazy_require "redcarpet"

  def render text
    engine.render text
  end

private
  def engine
    Redcarpet::Markdown.new Redcarpet::Render::HTML
  end
end
