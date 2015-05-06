class window.AppView extends Backbone.View
  template: _.template "
    <div class='container'>
      <h1>Black Jack</h1> 
  <center> 
    <div class='buttons'> 
      <button class='hit-button btn btn-primary'>Hit</button> 
      <button class='stand-button btn btn-warning'>Stand</button> 
      <button class='new-game-button btn btn-info'>New Game</button> 
    </div> 
  </center> 
  <div class='player-hand-container'></div> 
  <div class='dealer-hand-container'></div>
  "

  events:
    'click .hit-button': -> @model.hit()
    'click .stand-button': -> @model.stand()
    'click .new-game-button': -> 
      @model.newGame()
      @render()

  initialize: ->
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

