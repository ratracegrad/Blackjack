class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    @add(@deck.pop()).last()
    

  stand: ->
    console.log('stand button clicked')
    # @models[0].flip()
    # @dealerPlays()
    ''
  
  dealerPlays: ->
    console.log('dealerPlays')
    # if dealerScore < 17 
    console.log(@scores()[0])
    console.log(@scores()[1])
    # if Math.max(@scores[0],@scores[1]) < 17
    #   console.log('must hit')
    # else
    #   console.log('else')
    #while dealer must hit 
      #@add(@deck.pop()).last()
    #compare dealerScore to playerScore to announce winner
    #
    ''


  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + 10 * @hasAce()]


