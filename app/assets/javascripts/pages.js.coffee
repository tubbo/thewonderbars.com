class Page extends Backbone.Model
  defaults:
    html: ''

class Pages extends Backbone.Collection
  model: Page
  url: '/pages'

class PageView extends Backbone.View
  tagName: 'div'
  className: 'page'
  template: JST["templates/page.jst.hamlc"]
  events:
    'click .close-button': 'close'

  render: ->
    $(@el).html @template(@model.get('html'))
    return this

class NavigationView extends Backbone.View
  tagName: 'footer'
  template: JST["templates/navigation.jst.hamlc"]
  events:
    'click a': 'followLink'

  render: ->
    $(@el).html @template()
    return this

  followLink: (event) ->
    event.preventDefault()
    link = $(event.currentTarget)
    href = link.attr 'href'
    $.ajax
      url: href
      success: @_renderLinkResponse
      error: @_reportError

  _renderLinkResponse: (response) ->
    page = new Page html: response
    viewport = new PageView model: page
    $('#desktop').html viewport.render()

  _reportError: (xhr, message, status) ->
    alert message
    console.log xhr, status

class ApplicationView extends Backbone.View
  el: $('#wonderbars')
  template: JST["templates/application.jst.hamlc"]

  initialize: ->
    @navigation = new NavigationView().render()
    @layout = @template()

  render: ->
    $(@el).html(@layout).append(@navigation)
    return this
