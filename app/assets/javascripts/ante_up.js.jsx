$(function() {
  var Router = ReactRouter.Router;
  var Route = ReactRouter.Route;

  var rootEl = document.getElementById("content");
  var App = React.createClass({
    render: function() {
      return (
        <div>
          <header><h1>Ante Up</h1></header>
          {this.props.children}
        </div>
      );
    }
  });

  var routes = (
    <Route path="/" component={App}>
      <Route path="cards" component={CardsIndex}/>
      <Route path="cards/:cardId" component={CardShow}/>
    </Route>
  );

  React.render(<Router>{routes}</Router>, rootEl);
});
