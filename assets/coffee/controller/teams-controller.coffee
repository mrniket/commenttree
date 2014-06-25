define [
  'controller/radian-controller'
  'service/team-service'
], (RC) ->
  class extends RC
    @register 'TeamsController', [
      '$scope'
      'teamService'
    ]

    init: () ->
      @$scope.teams = @teamService.teams