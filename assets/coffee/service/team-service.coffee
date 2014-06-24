define [
  'config'
  'service/radian-service'
], (cfg, RS) ->
  class extends RS
    @register 'teamService', [
      '$firebase'
    ]

    init: ($firebase) ->
      teamsRef = new Firebase("#{cfg.firebaseUrl}/teams")
      @teams = @$firebase(teamsRef)