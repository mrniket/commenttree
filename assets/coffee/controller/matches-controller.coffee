define [
  'controller/radian-controller'
  'service/match-service'
  'service/team-service'
  'directive/match-listing-directive'
], (RC) ->
  class extends RC
    @register 'MatchesController', [
      '$scope'
      'matchService'
      'teamService'
    ]

    init: () ->
      @$scope.matches = @matchService.matches
