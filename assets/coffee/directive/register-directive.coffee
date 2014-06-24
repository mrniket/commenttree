define [
  'config'
  'directive/radian-directive'
  'service/team-service'
  'service/user-service'
], (cfg, RD) ->
  RD 'register', [
    'teamService'
    'userService'
  ], (teamService, userService) ->
    templateUrl: "#{cfg.path.partial}directive/register-partial.html"
    restrict: 'A'
    replace: true
    scope: {}
    link: ($scope, $element, $attrs) ->
      $scope.teams = teamService.teams
      $scope.register = () ->
        userService.register($scope.newUser).then (user) ->
          userService.login($scope.newUser)