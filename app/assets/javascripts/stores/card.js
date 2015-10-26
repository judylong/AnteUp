(function(rootEl) {
  var _cards = [];
  var CARDS_INDEX_CHANGE_EVENT = "cardsIndexChange";

  var resetCards = function(cards) {
    _cards = cards.slice(0);
  };

  var CardStore = rootEl.CardStore = $.extend({}, EventEmitter.prototype, {
    all: function() {
      return _cards.slice(0);
    },

    addCardsIndexChangeListener: function(callback) {
      this.on(CARDS_INDEX_CHANGE_EVENT, callback);
    },

    removeCardsIndexChangeListener: function(callback) {
      this.removeListener(CARDS_INDEX_CHANGE_EVENT, callback);
    },

    dispatcherID: AppDispatcher.register(function(payload) {
      switch (payload.actionType) {
        case AnteUpConstants.CARDS_RECEIVED:
          resetCards(payload.cards);
          CardStore.emit(CARDS_INDEX_CHANGE_EVENT);
          break;
        default:

      }
    })
  });
})(this);
