app.controller 'ChatCtr',['$scope','$meteor',($scope,$meteor)->
    currentHeight = null;
    window.setInterval(() ->
      elem = document.getElementById('chat_board');
      if elem && currentHeight != elem.scrollHeight
        elem.scrollTop = elem.scrollHeight
        currentHeight = elem.scrollHeight
    , 1000)

    Meteor.subscribe 'chatmsgs'
    $scope.chatmsgs = $meteor('chatmsgs').find({})
    $scope.chat = (msg,ev) ->
        if !ev||ev.which == 13
            Meteor.call 'chat',msg, (error) ->
                if error
                    showErrorNotify("Error",error.reason)
                else
                    ev.target.value=""

    
]
