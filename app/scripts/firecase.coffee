React = require 'react'
Router = require 'react-router'
Link = Router.Link
ReactBootstrap = require 'react-bootstrap'
Modal = ReactBootstrap.Modal
ModalTrigger = ReactBootstrap.ModalTrigger

Firecase = React.createClass
  displayName:'Firecase'
  eventHandler:(firebase_key)->
    console.log firebase_key
    #    fb =  new Firebase('https://ntpc119.firebaseio.com/Cases/'+firebase_key)
    #    onComplete = (error) ->
    #      if error
    #        console.log 'synchronization failed'
    #      else
    #        console.log 'synchronization succeeded'
    #    fb.update {'caseNo':1433486311797},onComplete
    #    fb.off()
  render:->
    firecaseList = []
    if @props.fireCases
      _.map @props.fireCases,(firecase,idx) =>
        firecaseList.push(
          <li className="collection-item avatar">
            <Link to="firecase_detail" params={{'id':idx}}>
              <i className="mdi-action-list circle red"></i>
            </Link>
            <span className="title">{firecase.caseInformation.address}</span>
            <p>{firecase.caseInformation.start_time}<br />
                {firecase.caseInformation.description}
            </p>
            <a onClick={@eventHandler.bind(@,idx)} className="secondary-content"><i className="mdi-action-info-outline"></i></a>
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
