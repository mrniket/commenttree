define [
  'config'
  'service/radian-service'
], (cfg, RS) ->
  class extends RS
    @register 'matchService', [
      '$q'
      '$firebase'
    ]

    init: () ->
      @matchesRef = new Firebase("#{cfg.firebaseUrl}/matches")
      @matches = @loadMatches()

    loadMatches: () ->
      @$firebase(@matchesRef)