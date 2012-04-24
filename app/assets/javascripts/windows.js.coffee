# Links in the "Dock" that get opened in desktop windows. Define the
# `.window` class in your stylesheets to stylize how the windows look.
#
# Windows are closed automatically when new links are opened.
class DesktopWindowLink
  constructor: (element, config) ->
    @element = element
    @config = config

  # GETs the page over Ajax and displays it in a .window
  render: ->
    $.ajax {
      url: @element.attr 'url'

      success: (response) ->
        desktop_window = $("<div class=\"#{@config.windowClass}\"></div>")
        desktop_window.html response
        this.clear()
        $('#desktop').append desktop_window
        desktop_window.show
    }

  # Clears all existing .windows from the #desktop
  clear: ->
    $("#desktop .#{@config.windowClass}").fadeOut 250
    $("#desktop .#{@config.windowClass}").remove()
    this

jQuery.fn.desktopWindow (options) ->
  config = {
    multiWindows: false
    closeButton: "/assets/close.png"
    windowClass: "window"
  }
  $.fn.extend config, options

  element = $(this)
  element.click (event) ->
    event.preventDefault()
    desktop_window_link = new DesktopWindowLink(element, config)
    desktop_window_link.clear().render()

  $('.window .close').live 'click' (event) ->
    event.preventDefault()
    $(this).fadeOut 250
    $(this).remove()
