define [
  'config'
  'directive/radian-directive'
  'service/user-service'
], (cfg, RD) ->
  RD 'login', [
    'userService'
    '$rootScope'
  ], (userService, $rootScope) ->
    templateUrl: "#{cfg.path.partial}directive/login-partial.html"
    restrict: 'A'
    replace: true
    scope: {}
    link: ($scope, $element, $attrs) ->
      $scope.currentUser = userService
      $scope.login = () ->
        userService.login($scope.newUser)