var CardShow = React.createClass({
  getInitialState: function() {
    var cardId = this.props.params.cardId;
    var card = this._findCardById(cardId);
    return { card: card };
  },

  _findCardById: function(id) {
    return CardStore.find(id)
  },

  _onChange: function() {
    this.setState({ card: this._findCardById(parseInt(this.props.params.cardId)) })
  },

  componentDidMount: function() {
    CardStore.addCardChangeListener(this._onChange);
    ApiUtil.fetchAllCards();
  },

  componentWillUnmount: function() {
    CardStore.removeCardChangeListener(this._onChange);
  },

  render: function() {
    if (this.state.card !== undefined) {
      return(
        <div>
          <p>{this.state.card.id}</p>
          <p>{this.state.card.name}</p>
        </div>
      )
    } else {
      return <div></div>
    }
  }
})
