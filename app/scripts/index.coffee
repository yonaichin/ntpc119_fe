React = require 'react'
Router = require 'react-router'
Link = Router.Link
ReactBootstrap = require 'react-bootstrap'
Modal = ReactBootstrap.Modal
ModalTrigger = ReactBootstrap.ModalTrigger

CaseModal = React.createClass
  displayName:'CaseModal'
  componentWillMount:->

  createCase:->
    #new firebase instance
    fb_onGoingCases = @props.firebaseInstance.OnGoingCases
    fb_cases= @props.firebaseInstance.FireCase

    caseNo = @props.caseNo
    startTime = new Date(caseNo)
    startTime = startTime.getFullYear()+'/'+(startTime.getMonth()+1)+'/'+startTime.getDate() + ' ' + startTime.toTimeString().split(' ')[0]
    caseInformation =
      'address': @refs.address.getDOMNode().value
      'start_time': startTime
      'caseType': '火警'
      'caseReporter': @refs.caseReporter.getDOMNode().value
      'caseReporterRelation': @refs.caseReporterRelation.getDOMNode().value
      'description': @refs.description.getDOMNode().value
      'buildingStructure': @refs.buildingStructure.getDOMNode().value
      'buildingFloorAbove': parseInt(@refs.buildingFloorAbove.getDOMNode().value) || 0
      'buildingFloorBelow': parseInt(@refs.buildingFloorBelow.getDOMNode().value) || 0
      'originOfFireFloor': parseInt(@refs.originOfFireFloor.getDOMNode().value) || 0
      'hasExplosion': @refs.hasExplosion.getDOMNode().value
      'flame': @refs.flame.getDOMNode().value
      'flameArea': parseInt(@refs.flameArea.getDOMNode().value) || 0
      'successionalBuildingFire': @refs.successionalBuildingFire.getDOMNode().value
      'peopleTrapped': parseInt(@refs.peopleTrapped.getDOMNode().value) || 0
    #prepare obj to  push to Cases
    firecase =
     'caseNo':caseNo
     'status':'ongoing'
     'radioChannel':''
     'dispatcher':@props.userInfo.name
     'caseInformation':caseInformation
     'resource':0
     'dispatchRequest':0
     'rescueInformation':0
    console.log firecase
    fb_cases.push(firecase)
    fb_onGoingCases.push(caseNo)
    #reset form
    @refs.firecase_form.getDOMNode().reset()
    @closeModal()
  closeModal:->
    $('#caseModal').closeModal()
  render:->
    case_no = @props.caseNo
    dispatcher = @props.userInfo.name
    <div>
      <div id="caseModal" className="modal bottom-sheet" >
          <div className="modal-content">
            <h4>新增火警案件</h4>
            <p>案件編號 : {case_no}</p>
            <p>派遣人員: {dispatcher}</p>
            <form ref="firecase_form" >
              <ul className="collapsible" data-collapsible="accordion">
                <li>
                  <div className="collapsible-header"><i className="mdi-action-info-outline"></i>發生地點</div>
                  <div className="collapsible-body ">
                    <div className="row">
                      <div className="input-field col s10 offset-s1">
                        <input ref="address" type="text" className="validate"/>
                        <label>地址</label>
                      </div>
                    </div>
                  </div>
                </li>
                <li>
                  <div className="collapsible-header"><i className="mdi-maps-place"></i>案件類別</div>
                  <div className="collapsible-body">
                    <div className="row">
                      <div className="input-field col s10 offset-s1">
                        <input ref="caseReporter" type="text" className="validate" />
                        <label>報案關係人</label>
                      </div>
                      <div className="input-field col s10 offset-s1">
                        <select defaultValue="" ref="caseReporterRelation" className="browser-default">
                          <option value="" disabled >關係人關係</option>
                          <option value="負責人">負責人</option>
                          <option value="戶長">戶長</option>
                          <option value="火首">火首</option>
                          <option value="其他">其他</option>
                        </select>
                      </div>
                      <div className="input-field col s10 offset-s1">
                        <textarea ref="description"  className="validate materialize-textarea"></textarea>
                        <label>案情簡述</label>
                      </div>
                    </div>
                  </div>
                </li>
                <li>
                  <div className="collapsible-header"><i className="mdi-social-people"></i>人命受困</div>
                  <div className="collapsible-body ">
                    <div className="row">
                      <div className="input-field col s10 offset-s1">
                        <input ref="peopleTrapped" type="number" className="validate"/>
                        <label>受困人數</label>
                      </div>
                    </div>
                  </div>
                </li>
                <li>
                  <div className="collapsible-header"><i className="mdi-action-home"></i>建物狀況</div>
                  <div className="collapsible-body ">
                    <div className="row">
                      <div className="input-field col s10 offset-s1">
                        <input ref="buildingFloorAbove" type="number" className="validate"/>
                        <label>建築物地上樓層</label>
                      </div>
                      <div className="input-field col s10 offset-s1">
                        <input ref="buildingFloorBelow" type="number" className="validate"/>
                        <label>建築物地下樓層</label>
                      </div>
                      <div className="input-field col s10 offset-s1">
                        <input ref="originOfFireFloor" type="number" className="validate"/>
                        <label>起火樓層</label>
                      </div>
                      <div className="input-field col s10 offset-s1">
                        <select defaultValue="" ref="buildingStructure" className="browser-default">
                          <option value="" disabled >建築物類型</option>
                          <option value="儲存、製造工廠">儲存、製造工廠</option>
                          <option value="住宅">住宅</option>
                          <option value="山火或住商混和大樓">山火或住商混和大樓</option>
                          <option value="辦公大樓">辦公大樓</option>
                          <option value="廠辦大樓">廠辦大樓</option>
                          <option value="工廠大樓">工廠大樓</option>
                          <option value="集合住宅">集合住宅</option>
                          <option value="重要建築物">重要建築物</option>
                        </select>
                      </div>
                    </div>
                  </div>
                </li>
                <li>
                  <div className="collapsible-header"><i className="mdi-image-flare"></i>火勢情況</div>
                  <div className="collapsible-body ">
                    <div className="row">
                      <div className="input-field col s10 offset-s1">
                        <select defaultValue="" ref="flame" className="browser-default">
                          <option value="" disabled >煙勢狀況</option>
                          <option value="黑煙">黑煙</option>
                          <option value="白煙">白煙</option>
                        </select>
                      </div>
                      <div className="input-field col s10 offset-s1">
                        <select  defaultValue="" ref="hasExplosion" className="browser-default">
                          <option value="" disabled >是否有爆炸</option>
                          <option value="true">有爆炸</option>
                          <option value="false">無爆炸</option>
                        </select>
                      </div>
                      <div className="input-field col s10 offset-s1">
                        <input ref="flameArea" type="number" className="validate"/>
                        <label>燃燒面積(平方公尺)</label>
                      </div>
                      <div className="input-field col s10 offset-s1">
                        <select defaultValue="" ref="successionalBuildingFire" className="browser-default">
                          <option value="" disabled >延燒可能性</option>
                          <option value="true">有延燒可能</option>
                          <option value="false">無延燒可能</option>
                        </select>
                      </div>
                    </div>
                  </div>
                </li>
              </ul>
            </form>
            <div className="container">
              <a className="waves-effect waves-light red btn-large offset-s5 " onClick={@createCase}>建立火警案件</a>
            </div>
          </div>
        </div>
    </div>

OngoingCasesCard = React.createClass
  displayName:'OngoingCasesCard'
  render:->
    <div className="col s12 m5">
      <div className="card-panel blue">
        <h4 className="white-text">現有 <span className="red-text">{@props.ongoingCasesCount}</span> 件火警案件</h4>
      </div>
    </div>
Clock = React.createClass
  displayName:'Clock'
  getInitialState:->
    currentTime:new Date().getTime()
  tick:->
    @setState
      currentTime:@state.currentTime+1000
  componentDidMount:->
    @interval = setInterval @tick,1000
  componentWillUnmount:->
    clearInterval @interval
  render:->
    <div className="col s12 m5">
      <div className="card-panel red lighten-2">
        <h4 className="white-text">{(new Date(@state.currentTime)).toLocaleTimeString()}</h4>
      </div>
    </div>
Index = React.createClass
  displayName:'INDEX'
  getInitialState:->
    case_no:0
  openModal: ->
    $('#caseModal').openModal()
    @setState
      case_no :Date.now()
  render: ->
    USER_TYPE = @props.userInfo.user_type
    if USER_TYPE is 'dispatch_center'
      <div className="container">
        <div className="fixed-action-btn" >
          <a className="btn-floating btn-large waves-effect waves-light red" onClick={@openModal}><i className="mdi-content-add"></i></a>
        </div>
        <h3>指揮中心 Dashboard</h3>
        <div className="row">
          <Clock />
          <OngoingCasesCard ongoingCasesCount={@props.onGoingCases.length}/>
        </div>
        <CaseModal caseNo={@state.case_no} userInfo={@props.userInfo} firebaseInstance={@props.firebaseInstance}/>
      </div>
    else
      <div className="container">
        <h3>火警現場 Dashboard</h3>
        <div className="row">
          <Clock />
          <OngoingCasesCard ongoingCasesCount={@props.onGoingCases.length}/>
        </div>
        </div>
module.exports = Index

