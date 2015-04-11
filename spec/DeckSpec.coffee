assert = chai.assert

describe 'deck', ->
  deck = null
  hand = null
  hand2 = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()
    hand2 = deck.dealDealer()

  describe 'hit', ->
    it 'should give the last card from the deck', ->
      assert.strictEqual deck.length, 48
      assert.strictEqual deck.last(), hand.hit()
      assert.strictEqual deck.length, 47

  describe 'stand', ->
    it 'when player stands then dealer should play', ->
      assert.strictEqual deck.length, 48
      # hand.stand()
      hand2.hit()
      assert.strictEqual deck.length, 47

  

  
