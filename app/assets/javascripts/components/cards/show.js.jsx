var CardShow = React.createClass({
  getInitialState: function() {
    var cardId = this.props.params.cardId;
    var card = this._findCardById(cardId);
    debugger
    return { card: card };
  },

  _findCardById: function(id) {
    return CardStore.find(id)
  },

  _onChange: function() {
    debugger
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
    debugger
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
