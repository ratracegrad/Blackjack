assert = chai.assert

describe 'deck', ->
  deck = null
  hand = null
  hand2 = null
  apl = null

  beforeEach ->
    apl = new AppView(model: new App())
    deck = apl.model.get('deck')

    hand = apl.model.get('playerHand')
    hand2 = apl.model.get('dealerHand')

describe 'show dealer hand', ->  
    it 'when player stands then show dealers down card', ->
      temp = hand2.scores()[0]
      hand.stand()
      temp2 = hand2.scores()[0]
      assert.notStrictEqual temp, temp2