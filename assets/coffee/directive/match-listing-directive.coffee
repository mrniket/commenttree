define [
  'config'
  'directive/radian-directive'
  'service/team-service'
], (cfg, RD) ->
  RD 'matchListing', [
    '$rootScope'
    'teamService'
  ], ($rootScope, teamService) ->
    templateUrl: cfg.path.partial + 'directive/match-listing-partial.html'
    restrict: 'E'
    replace: false
    scope:
      homeTeamId: '@'
      awayTeamId: '@'
    link: ($scope, $element, $attrs) ->
      # console.log teamService
      $scope.homeTeam = teamService.getTeamWithId($attrs.hometeamid)
      $scope.awayTeam = teamService.getTeamWithId($attrs.awayteamid)
      # console.log $scope.homeTeam