class window.CardView extends Backbone.View
  className: 'card'
  template: _.template '<img src="http://www.jenniferbland.com/blackjack/img/cards/<%= rankName %>-<%= suitName %>.png" /></div>'

  initialize: -> @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @model.attributes
    @$el.addClass 'covered' unless @model.get 'revealed'

