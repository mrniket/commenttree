define [
  'config'
  'angular'
  'service/team-service'
], (cfg, A) ->
  describe 'Team service', () ->
    service = null

    beforeEach module cfg.ngApp

    beforeEach inject ($injector) ->
      service = $injector.get 'teamService'

    it 'should load', () ->
      expect(service.fooBar).toBeDefined()