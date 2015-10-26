var CardsIndex = React.createClass({
  getInitialState: function() {
    return { cards: CardStore.all() };
  },

  _onChange: function() {
    this.setState({ cards: CardStore.all() });
  },

  componentDidMount: function()  {
    CardStore.addCardsIndexChangeListener(this._onChange);
    ApiUtil.fetchAllCards();
  },

  componentWillUnmount: function() {
    CardStore.removeCardsIndexChangeListener(this._onChange);
  },

  render: function() {
    return(
      <ul>
        {this.state.cards.map(function(card){
          return <CardIndexItem key={card.id} card={card} />
        })}
      </ul>
    );
  }
})
