ApiActions = {
  receiveAllCards: function(cards) {
    AppDispatcher.dispatch({
      actionType: AnteUpConstants.CARDS_RECEIVED,
      cards: cards
    });
  },

  receiveCard: function(card) {
    AppDispatcher.dispatch({
      actionType: AnteUpConstants.CARD_RECEIVED,
      card: card
    });
  },
}
