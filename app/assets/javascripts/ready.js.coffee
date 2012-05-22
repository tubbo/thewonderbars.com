jQuery ->
  $('nav a').on 'click', (event) ->
    $(this).addClass "clicked"

    Ext.create 'Ext.Window', {
      title: $(this).attr('title'),
      width: 600,
      height: 320,
      x: 10,
      y: 200,
      plain: true,
      layout: 'fit',
      items: {
          border: false
      }
    }.show()
