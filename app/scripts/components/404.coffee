# @jsx React.DOM
React = require 'react'
Router = require 'react-router'
Banner = require './banner'

NotFound = React.createClass
  displayName:'NotFound'
  render:->
    <div>
    <Banner />
    <section id="event" className="wrapper style2 align-center">
      <div className="container">
        <i className="fa fa-exclamation-triangle fa-5x"></i>
        <h2>無此頁面</h2>
        <p>Page Not Found</p>
      </div>
    </section>
    </div>
module.exports = NotFound
