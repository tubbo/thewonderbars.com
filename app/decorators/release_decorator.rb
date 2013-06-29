class ReleaseDecorator < Draper::Decorator
  delegate_all

  def name_and_catalog_number
    "(#{source.catalog_number}) #{name}"
  end

  def date
    source.released_on.strftime '%m %d, %y'
  end
end
