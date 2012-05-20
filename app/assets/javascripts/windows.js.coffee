# Links in the "Dock" that get opened in desktop windows. Define the
# `.window` class in your stylesheets to stylize how the windows look.
#
# Windows are closed automatically when new links are opened.
class DesktopWindow
  constructor: (link, config) ->
    @config = config
    @href = link.attr('href')
    @id = @href.split('/').join('')

  # GETs the page over Ajax and displays it in a .window. Clears out
  # other .windows if `config.windowClass = true`. Additionally, if
  # a cached window is found in the DOM
  render: ->
    unless @config.allowMultipleWindows
      $("#desktop .#{@config.windowClass}").hide()

    if $("##{id}").length
      @element = $("##{id}")
      @element.show()
    else
      $.ajax {
        url: href
        success: (response) ->
          @element = $("<div data-url=\"#{@href}\" class=\"#{@config.windowClass}\"></div>")
          @element.html(response)
          $('#desktop').append(@element)
          @element.show()
      }

jQuery.fn.openInDesktopWindow (options) ->
  config = {
    allowMultipleWindows: false
    windowClass: "window"
  }
  $.fn.extend config, options

  $(this).click (event) ->
    event.preventDefault()
    new DesktopWindow(element, config)

  $('.window .close').live 'click' (event) ->
    event.preventDefault()
    $(this).remove()
