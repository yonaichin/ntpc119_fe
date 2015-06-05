React = require 'react'
Router = require 'react-router'
Link = Router.Link
ReactBootstrap = require 'react-bootstrap'
Modal = ReactBootstrap.Modal
ModalTrigger = ReactBootstrap.ModalTrigger
Auth = require './service/auth'

#info = Auth.login('j2ason_lee@gmail.com','11111111')
#if info.authentication_token? then console.log 'info',info else console.log 'info',info.responseJSON.error
Login = React.createClass
  displayName:'Login'
  eventHandler: ->
    account = @refs.account.getDOMNode().value
    password = @refs.password.getDOMNode().value
    info = Auth.login(account,password)
    if info.authentication_token?
      @props.SetLoginInfo(info)
    else
      Materialize.toast(info.responseJSON.error,3000)
  render: ->
    <div>
      <nav className="top-nav fixed red darken-3">
        <div className="container">
          <div className="nav-wrapper center">登入</div>
        </div>
      </nav>
      <div className="row">
        <div className="col s12 center">
          <div className="card small">
            <div className="card-image waves-effect waves-block waves-light">
              <img className="activator" src="images/login_cover.jpg"/>
            </div>
            <div className="card-content">
              <span className="card-title activator grey-text text-darken-4">現場資源管理系統<i className="mdi-navigation-more-vert right"></i></span>
              <p><a>操作說明</a></p>
            </div>
            <div className="card-reveal">
              <span className="card-title grey-text text-darken-4">現場資源管理系統 <i className="mdi-navigation-close right"></i></span>
              <p>歡迎使用由台北大學資訊管理所出產的現場資源管理系統，讓您即時掌或火災現場資訊，即時回報資訊已確保資訊的一致性。</p>
            </div>
          </div>
        </div>
        <form className="col s12">
          <div className="row">
            <div className="input-field col s1"></div>
            <div className="input-field col s11">
              <i className="mdi-action-account-circle prefix"></i>
              <input ref="account" type="text" defaultValue="jason_lee@gmail.com"/>
              <label>帳號</label>
            </div>
          </div>
          <div className="row">
            <div className="input-field col s1"></div> <div className="input-field col s11">
              <i className="mdi-action-info prefix"></i>
              <input ref="password" type="password" defaultValue="11111111"/>
              <label>密碼</label>
            </div>
          </div>
          <div className="row">
             <div className="center">
               <button className="btn-large red lighten-1  waves-effect waves-light" type="button" onClick={@eventHandler}>送出
                 <i className="mdi-content-send right"></i>
               </button>
             </div>
          </div>
        </form>
      </div>
    </div>
module.exports = Login


