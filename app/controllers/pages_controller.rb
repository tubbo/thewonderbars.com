# Includes static content exclusive to this site. If we need it.
class PagesController < HighVoltage::PagesController
  layout :unless_xhr

protected
  def unless_xhr
    if request.xhr?
      false
    else
      'application'
    end
  end
end
