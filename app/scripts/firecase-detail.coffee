React = require 'react'
Router = require 'react-router'
Link = Router.Link
ReactBootstrap = require 'react-bootstrap'
Modal = ReactBootstrap.Modal
ModalTrigger = ReactBootstrap.ModalTrigger

_firebaseSync=(id,caseInformation)->
  fb =  new Firebase('https://ntpc119.firebaseio.com/Cases/'+id)
  onComplete = (error) ->
    if error
      console.log 'synchronization failed'
    else
      console.log 'synchronization succeeded'
  fb.update {'caseInformation':caseInformation},onComplete
  fb.off()
Dispatcher = React.createClass
  displayName:'Dispatch'
  render:->
    caseInformation = @props.caseInformation
    <div className="row">
      <div className="col s12 m6">
        <div className="card blue lighten-2">
          <div className="card-content">
            <span className="card-title activator white-text text-darken-4">案件地址</span>
            <p>{caseInformation.address}</p>
          </div>
        </div>
      </div>
      <div className="col s12 m6">
        <div className="card teal lighten-2 ">
          <div className="card-content">
            <span className="card-title activator white-text text-darken-4">案件類別 </span>
            <p>報案人: {caseInformation.caseReporter}</p>
            <p>關係人關係: {caseInformation.caseReporterRelation}</p>
            <p>案件敘述: {caseInformation.description}</p>
          </div>
        </div>
      </div>
      <div className="col s12 m6">
        <div className="card red lighten-2 ">
          <div className="card-content">
            <span className="card-title activator white-text text-darken-4">人命受困 </span>
            <p>受困人數: {caseInformation.peopleTrapped}</p>
          </div>
        </div>
      </div>
      <div className="col s12 m6">
        <div className="card blue-grey lighten-2 ">
          <div className="card-content">
            <span className="card-title activator white-text text-darken-4">建物狀況 </span>
            <p>建築物地上樓層: {caseInformation.buildingFloorAbove}</p>
            <p>建築物地下樓層: {caseInformation.buildingFloorBelow}</p>
            <p>起火樓層: {caseInformation.originOfFireFloor}</p>
            <p>建築物類型: {caseInformation.buildingStructure}</p>
          </div>
        </div>
      </div>
      <div className="col s12 m6">
        <div className="card deep-orange lighten-2 ">
          <div className="card-content">
            <span className="card-title activator white-text text-darken-4">火勢情況 </span>
            <p>煙勢狀況: {caseInformation.flame}</p>
            <p>是否有爆炸: {if caseInformation.hasExplosion is "true" then "有" else "無"}</p>
            <p>燃燒面積(平方公尺): {caseInformation.flameArea}</p>
            <p>延燒可能性: {if caseInformation.successionalBuildingFire is "true" then "有" else "無"}</p>
          </div>
        </div>
      </div>
   </div>
Commander = React.createClass
  displayName:'Commander'
  updateFire:(caseInformation)->
    flame = @refs.flame.getDOMNode().value
    hasExplosion = @refs.hasExplosion.getDOMNode().value
    flameArea = @refs.flameArea.getDOMNode().value
    successionalBuildingFire = @refs.successionalBuildingFire.getDOMNode().value

    caseInformation.flame = flame
    caseInformation.hasExplosion = hasExplosion
    caseInformation.flameArea = flameArea
    caseInformation.successionalBuildingFire = successionalBuildingFire

    currentFirecaseID = @props.CurrentFirecaseID
    _firebaseSync(currentFirecaseID,caseInformation)
  updateBuilding:(caseInformation)->
    buildingFloorAbove = @refs.buildingFloorAbove.getDOMNode().value
    buildingFloorBelow = @refs.buildingFloorBelow.getDOMNode().value
    originOfFireFloor = @refs.originOfFireFloor.getDOMNode().value
    buildingStructure = @refs.buildingStructure.getDOMNode().value

    caseInformation.buildingFloorAbove = buildingFloorAbove
    caseInformation.buildingFloorBelow = buildingFloorBelow
    caseInformation.originOfFireFloor = originOfFireFloor
    caseInformation.buildingStructure = buildingStructure

    currentFirecaseID = @props.CurrentFirecaseID
    _firebaseSync(currentFirecaseID,caseInformation)
  updatePeople:(caseInformation)->
    peopleTrapped = @refs.peopleTrapped.getDOMNode().value

    caseInformation.peopleTrapped = peopleTrapped

    currentFirecaseID = @state.CurrentFirecaseID
    _firebaseSync(currentFirecaseID,caseInformation)
  updateInfo:(caseInformation)->
    caseReporter = @refs.caseReporter.getDOMNode().value
    caseReporterRelation = @refs.caseReporterRelation.getDOMNode().value
    description = @refs.description.getDOMNode().value

    caseInformation.caseReporter = caseReporter
    caseInformation.caseReporterRelation = caseReporterRelation
    caseInformation.description = description

    currentFirecaseID = @props.CurrentFirecaseID
    _firebaseSync(currentFirecaseID,caseInformation)
  updateAddress:(caseInformation)->
    address = @refs.address.getDOMNode().value
    caseInformation.address = address
    currentFirecaseID = @props.CurrentFirecaseID
    _firebaseSync(currentFirecaseID,caseInformation)
  render:->
    caseInformation = @props.caseInformation
    <div className="row">
      <div className="col s12 m6">
        <div className="card small blue lighten-2">
          <div className="card-content">
            <span className="card-title activator white-text text-darken-4">案件地址<i className="mdi-navigation-more-vert right"></i></span>
            <p>{caseInformation.address}</p>
            <button className="btn">查看甲種圖</button>
            <button className="btn">查看乙種圖</button>
          </div>
          <div className="card-reveal">
            <span className="card-title grey-text text-darken-4">案件地址<i className="mdi-navigation-close right"></i></span>
            <div className="input-field col s10 offset-s1">
              <input ref="address" type="text" className="validate" defaultValue={caseInformation.address}/>
              <label>地址</label>
              <div className="container">
                <a className="waves-effect waves-light right teal btn" onClick={@updateAddress.bind(@,caseInformation)}>更新地址</a>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div className="col s12 m6">
        <div className="card small teal lighten-2 ">
          <div className="card-content">
            <span className="card-title activator white-text text-darken-4">案件類別 <i className="mdi-navigation-more-vert right"></i></span>
            <p>報案人: {caseInformation.caseReporter}</p>
            <p>關係人關係: {caseInformation.caseReporterRelation}</p>
            <p>案件敘述: {caseInformation.description}</p>
          </div>
          <div className="card-reveal">
            <span className="card-title grey-text text-darken-4">案件類別<i className="mdi-navigation-close right"></i></span>
            <div className="input-field col s10 offset-s1">
              <input ref="caseReporter" defaultValue={caseInformation.caseReporter} type="text" className="validate" />
              <label>報案關係人</label>
            </div>
            <div className="input-field col s10 offset-s1">
              <select defaultValue={caseInformation.caseReporterRelation} ref="caseReporterRelation" className="browser-default">
                <option value="" disabled >關係人關係</option>
                <option value="負責人">負責人</option>
                <option value="戶長">戶長</option>
                <option value="火首">火首</option>
                <option value="其他">其他</option>
              </select>
            </div>
            <div className="input-field col s10 offset-s1">
              <textarea defaultValue={caseInformation.description} ref="description"  className="validate materialize-textarea"></textarea>
              <label>案情簡述</label>
            </div>
              <div className="container">
                <a className="waves-effect waves-light right teal btn" onClick={@updateInfo.bind(@,caseInformation)}>更新類別</a>
              </div>
          </div>
        </div>
      </div>
      <div className="col s12 m6">
        <div className="card small red lighten-2 ">
          <div className="card-content">
            <span className="card-title activator white-text text-darken-4">人命受困 <i className="mdi-navigation-more-vert right"></i></span>
            <p>受困人數: {caseInformation.peopleTrapped}</p>
          </div>
          <div className="card-reveal">
            <span className="card-title grey-text text-darken-4">人命受困<i className="mdi-navigation-close right"></i></span>
            <div className="input-field col s10 offset-s1">
              <input ref="peopleTrapped" defaultValue={caseInformation.peopleTrapped} type="number" className="validate"/>
              <label>受困人數</label>
            </div>
              <div className="container">
                <a className="waves-effect waves-light right teal btn" onClick={@updatePeople.bind(@,caseInformation)}>更新人數</a>
              </div>
          </div>
        </div>
      </div>
      <div className="col s12 m6">
        <div className="card small blue-grey lighten-2 ">
          <div className="card-content">
            <span className="card-title activator white-text text-darken-4">建物狀況 <i className="mdi-navigation-more-vert right"></i></span>
            <p>建築物地上樓層: {caseInformation.buildingFloorAbove}</p>
            <p>建築物地下樓層: {caseInformation.buildingFloorBelow}</p>
            <p>起火樓層: {caseInformation.originOfFireFloor}</p>
            <p>建築物類型: {caseInformation.buildingStructure}</p>
          </div>
          <div className="card-reveal">
            <span className="card-title grey-text text-darken-4">建物狀況<i className="mdi-navigation-close right"></i></span>
              <div className="input-field col s10 offset-s1">
                <input ref="buildingFloorAbove" defaultValue={caseInformation.buildingFloorAbove} type="number" className="validate"/>
                <label>建築物地上樓層</label>
              </div>
              <div className="input-field col s10 offset-s1">
                <input ref="buildingFloorBelow" defaultValue={caseInformation.buildingFloorBelow} type="number" className="validate"/>
                <label>建築物地下樓層</label>
              </div>
              <div className="input-field col s10 offset-s1">
                <input ref="originOfFireFloor" defaultValue={caseInformation.originOfFireFloor} type="number" className="validate"/>
                <label>起火樓層</label>
              </div>
              <div className="input-field col s10 offset-s1">
                <select defaultValue={caseInformation.buildingStructure} ref="buildingStructure" className="browser-default">
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
              <div className="container">
                <a className="waves-effect waves-light right teal btn" onClick={@updateBuilding.bind(@,caseInformation)}>更新建物</a>
              </div>
          </div>
        </div>
      </div>
      <div className="col s12 m6">
        <div className="card small deep-orange lighten-2 ">
          <div className="card-content">
            <span className="card-title activator white-text text-darken-4">火勢情況 <i className="mdi-navigation-more-vert right"></i></span>
            <p>煙勢狀況: {caseInformation.flame}</p>
            <p>是否有爆炸: {if caseInformation.hasExplosion is "true" then "有" else "無"}</p>
            <p>燃燒面積(平方公尺): {caseInformation.flameArea}</p>
            <p>延燒可能性: {if caseInformation.successionalBuildingFire is "true" then "有" else "無"}</p>
          </div>
          <div className="card-reveal">
            <span className="card-title grey-text text-darken-4">火勢情況<i className="mdi-navigation-close right"></i></span>
              <div className="input-field col s10 offset-s1">
                <select defaultValue={caseInformation.flame} ref="flame" className="browser-default">
                  <option value="" disabled >煙勢狀況</option>
                  <option value="黑煙">黑煙</option>
                  <option value="白煙">白煙</option>
                </select>
              </div>
              <div className="input-field col s10 offset-s1">
                <select  defaultValue={caseInformation.hasExplosion} ref="hasExplosion" className="browser-default">
                  <option value="" disabled >是否有爆炸</option>
                  <option value="true">有爆炸</option>
                  <option value="false">無爆炸</option>
                </select>
              </div>
              <div className="input-field col s10 offset-s1">
                <input ref="flameArea" type="number" defaultValue={caseInformation.flameArea} className="validate"/>
                <label>燃燒面積(平方公尺)</label>
              </div>
              <div className="input-field col s10 offset-s1">
                <select defaultValue="" ref="successionalBuildingFire" defaultValue={caseInformation.successionalBuildingFire} className="browser-default">
                  <option value="" disabled >延燒可能性</option>
                  <option value="true">有延燒可能</option>
                  <option value="false">無延燒可能</option>
                </select>
              </div>
              <div className="container">
                <a className="waves-effect waves-light right teal btn" onClick={@updateFire.bind(@,caseInformation)}>更新火勢</a>
              </div>
          </div>
        </div>
      </div>
   </div>
FirecaseDetail = React.createClass
  displayName:'FirecaseDetail'
  getInitialState:->
    CurrentFirecaseID:@props.routeParams.id
  render:->
    caseInformation = {}
    if @props.fireCases
      id = @props.routeParams.id
      _.map @props.fireCases,(firecase,idx)=>
        caseInformation =  firecase.caseInformation if id is idx
    content = if @props.userInfo.user_type is "dispatch_center" then <Dispatcher caseInformation={caseInformation} CurrentFirecaseID={@props.routeParams.id}/> else <Commander caseInformation={caseInformation} CurrentFirecaseID={@props.routeParams.id}/>
    <div className="">
      <h3>案情資訊</h3>
      {content}
    </div>
module.exports = FirecaseDetail

