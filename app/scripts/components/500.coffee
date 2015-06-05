# @jsx React.DOM
React = require 'react/addons'
Router = require 'react-router'
Banner = require './banner'
Navbar = require './navbar'
Footer = require './footer'
ServiceUnavailable = React.createClass
  displayName:'ServiceUnavailable'
  render:->
    <div>
    <Banner />
    <section id="event" className="wrapper style2 align-center">
      <div className="container">
        <i className="fa fa-exclamation-triangle fa-5x"></i>
        <h2>目前碰到一點問題，等待處理中...</h2>
        <p>Service Unavailable</p>
      </div>
    </section>
    <Footer />
    </div>
module.exports = ServiceUnavailable
