module ApplicationHelper
  def title new_title
    content_for :title, new_title
    content_tag :h2, new_title
  end

  def title_tag
    page_title = content_for :title

    if page_title.present?
      content_tag :title, "#{page_title} | The Wonder Bars"
    else
      content_tag :title, "The Wonder Bars | Philly House Music"
    end
  end

  def meta_description_from_facebook
    facebook = FacebookClient.new
    content_tag :meta, facebook.description, name: "description"
  end
end
