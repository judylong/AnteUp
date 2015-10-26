(function(rootEl) {
  var _cards = [];
  var CARDS_INDEX_CHANGE_EVENT = "cardsIndexChange";
  var CARD_CHANGE_EVENT = "cardChange"

  var resetCards = function(cards) {
    _cards = cards.slice(0);
  };

  var CardStore = rootEl.CardStore = $.extend({}, EventEmitter.prototype, {
    all: function() {
      return _cards.slice(0);
    },

    find: function(id) {
      var card;
      _cards.forEach(function(c) {
        if (c.id === id) { card = c; }
      })

      return card;
    },

    addCardsIndexChangeListener: function(callback) {
      this.on(CARDS_INDEX_CHANGE_EVENT, callback);
    },

    removeCardsIndexChangeListener: function(callback) {
      this.removeListener(CARDS_INDEX_CHANGE_EVENT, callback);
    },

    addCardChangeListener: function(callback) {
      this.on(CARD_CHANGE_EVENT, callback);
    },

    removeCardChangeListener: function(callback) {
      this.removeListener(CARD_CHANGE_EVENT, callback)
    },

    dispatcherID: AppDispatcher.register(function(payload) {
      switch (payload.actionType) {
        case AnteUpConstants.CARDS_RECEIVED:
          resetCards(payload.cards);
          CardStore.emit(CARDS_INDEX_CHANGE_EVENT);
          CardStore.emit(CARD_CHANGE_EVENT);
          break;
        case AnteUpConstants.CARD_RECEIVED:
          CardStore.emit(CARD_CHANGE_EVENT);
        default:

      }
    })
  });
})(this);
