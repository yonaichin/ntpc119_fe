React = require 'react/addons'
PureRenderMixin = require('react/addons').addons.PureRenderMixin
Router = require 'react-router'
Link = Router.Link
Navbar = React.createClass
  displayName: 'Navbar'
  mixins: [PureRenderMixin]
  componentDidMount:->
    $(".button-collapse").sideNav()
  render : ->
    <nav>
      <div className="nav-wrapper red darken-3">
        <Link to="index" className="brand-logo">NTPC119</Link>
        <a href="#" data-activates="mobile-demo" className="button-collapse"><i className="mdi-navigation-menu"></i></a>
        <ul className="right hide-on-med-and-down">
          <li><Link to="firecase">案情資訊</Link></li>
          <li><a href="#">火場資訊回報</a></li>
          <li><a href="#">資源管理</a></li>
          <li><a href="#">資源增派</a></li>
        </ul>
        <ul className="side-nav" id="mobile-demo">
          <li><Link className="waves-effect waves-red" to="firecase">案情資訊</Link></li>
          <li><a className="waves-effect waves-red" href="#">火場資訊回報</a></li>
          <li><a className="waves-effect waves-red" href="#">資源管理</a></li>
          <li><a className="waves-effect waves-red" href="#">資源增派</a></li>
        </ul>
      </div>
    </nav>
module.exports = Navbar
