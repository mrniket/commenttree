define [
  'controller/radian-controller'
  'service/user-service'
], (RC) ->
  class extends RC
    @register 'HomeController', [
      '$scope'
      'userService'
      '$rootScope'
    ]

    init: ($scope) ->

    logoutUser: () =>
      @userService.logout()