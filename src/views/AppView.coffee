class window.AppView extends Backbone.View
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <button class="new-game-button">New Game</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    # 'click .hit-button': -> @model.get('playerHand').hit()
    'click .hit-button': -> @model.testHit()
    # 'click .stand-button': -> @model.get('dealerHand').stand()
    'click .stand-button': -> @model.testStand()
    'click .new-game-button': -> 
      @model.newGame()
      @render()


  initialize: ->
    @render()

  render: ->
    console.log('render in AppView')
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

