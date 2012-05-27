jQuery ->
  slowly = 250
  quickly = 100
  desktop = $('#desktop')
  spinner = $('#spinner')

  # Spinner gif gets loaded in between requests
  desktop.ajaxSend -> spinner.css('display', 'inline')
         .ajaxComplete -> spinner.css('display', 'none')

  # Requests pages with Pjax sorta.
  $('nav a').on 'click', (event) ->
    event.preventDefault()
    link = $(this)

    $('#desktop > div').fadeOut(slowly).remove()

    $.ajax {
      url: link.attr('href')
      type: 'GET'
      dataType: 'html'
      success: (new_window_html) ->

        new_window = $(new_window_html)
        desktop.append new_window

        new_window.fadeIn slowly

        if history?
          history.pushState null, "#{link.text()} | The Wonder Bars", link.attr('href')

      failure: (xhr, error) ->
        alert error
    }
