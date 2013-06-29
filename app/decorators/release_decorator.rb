class ReleaseDecorator < Draper::Decorator
  delegate_all

  def name_and_catalog_number
    "(#{source.catalog_number}) #{name}"
  end

  def date
    source.released_on.strftime '%B %e, %Y'
  end
end
