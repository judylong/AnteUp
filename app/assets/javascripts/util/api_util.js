ApiUtil = {
  fetchAllCards: function() {
    debugger
    $.ajax({
      url: "api/cards",
      success: function(cards) {
        console.log("got 'em all'");
        ApiActions.receiveAllCards(cards);
      }
    })
  },

  fetchCard: function(id) {
    $.ajax({
      url: 'api/cards/'+ id,
      success: function(card){
        console.log("got it");
        ApiActions.receiveCard(card);
      }
    });
  },

}
