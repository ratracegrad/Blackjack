class window.App extends Backbone.Model
  initialize: ->    
    @newGame()
    
  hit: ->
    # pScore = @get('playerHand').scores()[0]
    pScore = @get('playerHand').maxScore()
    if pScore < 21
      @get('playerHand').hit()
      # pScore = @get('playerHand').scores()[0]
      pScore = @get('playerHand').maxScore()
      if pScore > 21
        @playAgain('Player Busts! Play Again?')
    else
      @playAgain('Can\'t deal because you busted! Play Again?')

  stand: ->
    @get('dealerHand').models[0].flip()
    # pScore = @get('playerHand').scores()[0]
    # dScore = @get('dealerHand').scores()[0]
    pScore = @get('playerHand').maxScore()
    dScore = @get('dealerHand').maxScore()
    
    if pScore > 21
      @playAgain('Player Busts - Can\'t Stand. Play Again?')
    else
      if dScore == 21
        @playAgain('dealer has blackjack')

      while dScore < 17
        @get('dealerHand').hit()
        # dScore = @get('dealerHand').scores()[0]
        dScore = @get('dealerHand').maxScore()

      if dScore > 21
        @playAgain('player wins')
      else if dScore == pScore
        @playAgain('tie')
      else
        while dScore < pScore
          @get('dealerHand').hit()
          # dScore = @get('dealerHand').scores()[0]
          dScore = @get('dealerHand').maxScore()

        if dScore > 21
          @playAgain('player wins')
        else if dScore == pScore
          @playAgain('tie')
        else
          @playAgain('dealer wins')

    ''
 
  playAgain: (message) ->
    ans = confirm message
    if ans
      @newGame()
    else
      ''
  newGame: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    ''
