API_HOST = process.env.API_HOST
auth =
  login:(account,password) ->
    list={}
    data = {"user":{"email":account, "password":password}}
    console.log 'data',data
    $.ajax
      async:false
      headers:
        'Accept':'application/json'
        'Content-Type':'application/json'
      type:'POST'
      url:API_HOST+'users/sign_in.json'
      data:JSON.stringify(data)
      dataType:'json'
    .done((result)->
      list = result
      sessionStorage.userInfo = JSON.stringify result
    )
    .fail((err)->
      list = err
    )
    list
module.exports = auth
