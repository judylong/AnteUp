ApiUtil = {
  fetchAllCards: function() {
    $.ajax({
      url: "api/cards",
      success: function(cards) {
        console.log("got 'em all'");
        ApiActions.recieveAllCards(cards);
      }
    })
  },

  fetchCard: function(id) {
    $.ajax({
      url: 'api/cards/'+ id,
      success: function(card){
        console.log("got it");
        ApiActions.recieveCard(card);
      }
    });
  },

}
