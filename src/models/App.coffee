# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    # @set 'deck', deck = new Deck()
    @newGame()
    # @set 'playerHand', deck.dealPlayer()
    # @set 'dealerHand', deck.dealDealer()

  testHit: ->
    pScore = @get('playerHand').scores()[0]
    if pScore < 21
      @get('playerHand').hit()
      pScore = @get('playerHand').scores()[0]
      if pScore > 21
        # alert 'Player Busts! Play Again?'
        @playAgain('Player Busts! Play Again?')
    else
      # alert 'Can\'t deal because you busted! Play Again?'
      @playAgain('Can\'t deal because you busted! Play Again?')

  playAgain: (message) ->
    ans = confirm message
    if ans
      @newGame()
    else
      ''
  newGame: ->
    console.log('newGame')
    # if @get('deck').length < 10
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    # @view.render()
    console.log(deck.length)
    ''

  testStand: ->
    pScore = @get('playerHand').scores()[0]
    dScore = @get('dealerHand').scores()[0]

    if pScore > 21
      # ans = confirm 'Player Busts - Can\'t Stand. Play Again?'
      # if ans
      #   @newGame()
      @playAgain('Player Busts - Can\'t Stand. Play Again?')
    else
      @get('dealerHand').models[0].flip()
      
      while dScore < 17
        @get('dealerHand').hit()
        dScore = @get('dealerHand').scores()[0]

      if dScore > 21
        # alert 'player wins'
        @playAgain('player wins')
      else if dScore == pScore
        # alert 'tie'
        @playAgain('tie')
      else
        while dScore < pScore
          @get('dealerHand').hit()
          dScore = @get('dealerHand').scores()[0]

        if dScore > 21
          # alert 'player wins'
          @playAgain('player wins')
        else if dScore == pScore
          # alert 'tie'
          @playAgain('tie')
        else
          # alert 'dealer wins'
          @playAgain('dealer wins')

    ''
 