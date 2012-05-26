jQuery ->
  $('nav a').on 'click', (event) ->
    $(this).addClass "clicked"
