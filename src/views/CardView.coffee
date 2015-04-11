class window.CardView extends Backbone.View
  className: 'card'
  template: _.template '<img src="img/cards/<%= rankName %>-<%= suitName %>.png" />'
  # template: _.template '<img src="img/cards/<%= rankName %>-<%= suitName %>.png" height="140px"/>'
  # template: _.template '<%= rankName %> of <%= suitName %>'
  # _.template '<img src="img/cards/<%= rankName %>-<%= suitName %>.png" height="140px"/>'
  initialize: -> @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @model.attributes
    @$el.addClass 'covered' unless @model.get 'revealed'

