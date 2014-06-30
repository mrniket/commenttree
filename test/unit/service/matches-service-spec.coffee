define [
  'config'
  'angular'
  'service/matches-service'
], (cfg, A) ->
  describe 'Matches service', () ->
    service = null

    beforeEach module cfg.ngApp

    beforeEach inject ($injector) ->
      service = $injector.get 'matchesService'

    it 'should load', () ->
      expect(service.fooBar).toBeDefined()