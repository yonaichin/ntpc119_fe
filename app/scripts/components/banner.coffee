React = require 'react/addons'
Router = require 'react-router'
Link = Router.Link
Banner = React.createClass
  displayName: 'Banner'
  render : ->
    bannerStyle =  if @props.bannerStyle then @props.bannerStyle else 'banner'


    if bannerStyle is 'welcome'
      <section id="banner">
        <h2>國立台北大學資訊管理研究所</h2>
        <p>Graduate Institute of Information Management, NTPU</p>
        <ul className="actions">
          <li>
            <a href="#/admission" className="button big">加入我們</a>
          </li>
        </ul>
      </section>
    else
      <section id="one" className="wrapper style1 align-center">
        <div className="container">
          <header>
            <h2>國立台北大學資訊管理研究所</h2>
            <p>培育「資訊社會」與「電子化企業」所需專業與研究人才</p>
          </header>
          <div className="row 200%">
            <section className="4u 12u$(small)">
              <i className="icon big rounded fa-desktop"></i>
            <p>培養資訊系統管理專業能力</p>
            </section>
            <section className="4u 12u$(small)">
              <i className="icon big rounded fa-university"></i>
            <p>培養網路行銷專業能力</p>
            </section>
            <section className="4u 12u$(small)">
              <i className="icon big rounded fa-bookmark"></i>
            <p>培養研究能力</p>
            </section>
          </div>
        </div>
      </section>

module.exports = Banner
