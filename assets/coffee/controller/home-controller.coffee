define [
  'controller/radian-controller'
  'service/user-service'
], (RC) ->
  class extends RC
    @register 'HomeController', [
      '$scope'
      'userService'
    ]

    init: ($scope) ->

    logoutUser: () =>
      console.log "logout reached"
      @userService.logout()