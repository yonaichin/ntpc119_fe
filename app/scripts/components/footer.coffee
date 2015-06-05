React = require 'react/addons'

Copyright = React.createClass
  displayName:'Copyright'
  render : ->
     <ul className="copyright">
       <li><i className="fa fa-copyright"></i> NTPUMIS All rights reserved.</li>
       <li>Design: <a href="http://templated.co">TEMPLATED</a></li>
       <li>Images: <a href="http://unsplash.com">Unsplash</a></li>
       <li>Developed by : <a href="http://github.com/yonaichin">yonaichin</a>, kapiobhee</li>
     </ul>
Footer = React.createClass
  displayName: 'Footer'
  componentDidMount : ->
    $('#map').tinyMap
      'center': '24.944582, 121.369743'
      'zoom': 15
      'disableDefaultUI': true
      'scrollwheel':false
      'draggable': false
  render : ->
    <footer id="footer">
      <div className="container">
        <div className="row">
          <section className="4u 6u(medium) 12u$(small)">
            <h3>相關連結</h3>
            <ul className="alt">
              <li><a target="_blank" href="http://www.ntpu.edu.tw/" target="_blank">國立臺北大學</a></li>
              <li><a target="_blank" href="http://www.lib.ntpu.edu.tw/" target="_blank">國立臺北大學圖書館</a></li>
              <li><a target="_blank" href="http://ndltd.ncl.edu.tw/cgi-bin/gs32/gsweb.cgi/login?o=dwebmge" target="_blank">臺灣博碩士論文知識加值系統</a></li>
              <li><a target="_blank" href="http://academic-journals.org/ecs/" target="_blank">電子商務研究期刊</a></li>
              <li><a target="_blank" href="http://scholar.google.com.tw" target="_blank">Google 學術搜尋</a></li>
              <li><a target="_blank" href="http://www.ntpu.edu.tw/files/studenthandbook.pdf" target="_blank" >臺北大學學生手冊</a></li>
              <li><a target="_blank" href="http://www.mis.ntpu.edu.tw/files/ntpuiim_stu_man.pdf" target="_blank" >臺北大學資管所學生手冊</a></li>
            </ul>
          </section>
          <section className="4u 6u$(medium) 12u$(small)">
            <h3>地理位置</h3>
            <div id="map"></div>
          </section>
          <section className="4u$ 12u$(medium) 12u$(small)">
            <h3>聯絡資訊</h3>
            <ul className="icons">
              <li><a target="_blank" href="https://www.facebook.com/176780765671055" className="icon rounded fa-facebook"><span className="label">Facebook</span></a></li>
              <li><a target="_blank" href="https://picasaweb.google.com/ntpuimis" className="icon rounded fa-picture-o"><span className="label">Photos</span></a></li>
              <li>所辦助教 : 鄧雅燕 助教</li>
            </ul>
            <ul className="tabular">
              <li>
                <h3><i className="icon rounded fa-map-marker"></i></h3>
              237 新北市三峽區大學路151號商學大樓8樓
              </li>
              <li>
                <h3><i className="icon rounded fa-envelope-o"></i></h3>
                <a href="#">yyteng@mail.ntpu.edu.tw</a>
              </li>
              <li>
                <h3><i className="icon rounded fa-phone"></i></h3>
                (02)8674-1111 分機 66894
              </li>
            </ul>
          </section>
        </div>
      <Copyright />
      </div>
    </footer>
module.exports = Footer
