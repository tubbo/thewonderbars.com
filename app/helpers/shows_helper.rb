module ShowsHelper
  def link_to_placeholder with_title
    link_to_function with_title, "alert('Facebook event page coming soon.');"
  end
end
