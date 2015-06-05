React = require 'react'
Router = require 'react-router'
Link = Router.Link
ReactBootstrap = require 'react-bootstrap'
Modal = ReactBootstrap.Modal
ModalTrigger = ReactBootstrap.ModalTrigger

Firecase = React.createClass
  displayName:'Firecase'
  render:->
    firecaseList = []
    if @props.fireCases
      @props.fireCases.map (firecase) ->
        firecaseList.push(
          <li className="collection-item avatar">
            <i className="mdi-action-list circle red"></i>
            <span className="title">{firecase.caseInformation.address}</span>
            <p>{firecase.caseInformation.start_time}<br />
                {firecase.caseInformation.description}
            </p>
          </li>
          )
    if firecaseList.length isnt 0
      <div className="container">
        <ul className="collection">
          {firecaseList}
        </ul>
      </div>
    else
      <div>no cases</div>
module.exports = Firecase
