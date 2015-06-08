React = require 'react'
Router = require 'react-router'
Link = Router.Link
ReactBootstrap = require 'react-bootstrap'
Modal = ReactBootstrap.Modal
ModalTrigger = ReactBootstrap.ModalTrigger


Test = React.createClass
  displayName:'Test'
  render: ->
    <div>Test{@props.routeParams.id}</div>
module.exports = Test

