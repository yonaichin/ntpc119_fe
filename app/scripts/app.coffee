# @jsx React.DOM
React = require 'react'
Router = require 'react-router'
ReactFireMixin = require 'reactfire'
DefaultRoute = Router.DefaultRoute
Link = Router.Link
Route = Router.Route
RouteHandler = Router.RouteHandler
NotFoundRoute = Router.NotFoundRoute
Index = require './index'
Test = require './test'
Login = require './login'
Navbar = require './components/navbar'
Firecase = require './firecase'
FirecaseDetail = require './firecase-detail'
Main = React.createClass
  mixins:[ReactFireMixin]
  displayName:'Main'
  loginHandler:(info)->
    @setState
      UserInfo:
        token : info.authentication_token
        name : info.name
        email : info.email
        rank : info.rank
        user_type : info.user_type
  componentWillMount:->
    @bindAsArray @state.FirebaseInstance.OnGoingCases, "OnGoingCases"
    @bindAsObject @state.FirebaseInstance.FireCase.orderByChild("status").equalTo('ongoing'),'Firecases'
  componentWillUnmount:->
    @state.FirebaseInstance.FireCase.off()
    @state.FirebaseInstance.OnGoingCases.off()
  getInitialState:->
    FirebaseInstance:
      FireCase: new Firebase('https://ntpc119.firebaseio.com/Cases')
      OnGoingCases: new Firebase('https://ntpc119.firebaseio.com/OnGoingCases')
    OnGoingCases:[]
    CurrentCaseID:null
    UserInfo:
      token : null || if sessionStorage.userInfo then JSON.parse(sessionStorage.userInfo).authentication_token else null
      name : null || if sessionStorage.userInfo then JSON.parse(sessionStorage.userInfo).name else null
      email : null || if sessionStorage.userInfo then JSON.parse(sessionStorage.userInfo).email else null
      rank : null || if sessionStorage.userInfo then JSON.parse(sessionStorage.userInfo).rank else null
      user_type : null || if sessionStorage.userInfo then JSON.parse(sessionStorage.userInfo).user_type else null
  setCurrentCase:(id)->
    @state.CurrentCaseID = id
  render:->
    if @state.UserInfo.token is null
      <Login SetLoginInfo={@loginHandler}/>
    else
      <div>
        <Navbar />
        <RouteHandler userInfo={@state.UserInfo}
                      firebaseInstance={@state.FirebaseInstance}
                      fireCases={@state.Firecases}
                      {...@props}
                      setCurrentCase={@setCurrentCase}
                      onGoingCases={@state.OnGoingCases}/>
      </div>
routes =
  <Route name="index" path="/" handler={Main}>
    <DefaultRoute handler={Index}/>
    <Route name="test" path="/test/:id" handler={Test}/>
    <Route name="firecase" handler={Firecase} />
    <Route name="firecase_detail" path="/firecase/detail/:id" handler={FirecaseDetail} />
  </Route>
module.exports =
  Router.run routes,Router.HashLocation,(Handler,state)->
    React.render <Handler routeParams={state.params}/>, document.querySelector '#app'
