# Global view methods for modifying the page title.
module TitleHelper
  # Set the new title on the page.
  def title new_title
    content_for :title, new_title
    content_tag :h2, new_title
  end

  # Render a +<title>+ tag in the header.
  def title_tag
    page_title = content_for :title

    if page_title.present?
      content_tag :title, "#{page_title} | The Wonder Bars"
    else
      content_tag :title, "The Wonder Bars | Philly House Music"
    end
  end
end
