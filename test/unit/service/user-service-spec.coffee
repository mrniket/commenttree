define [
  'config'
  'angular'
  'service/user-service'
], (cfg, A) ->
  describe 'User service', () ->
    service = null

    beforeEach module cfg.ngApp

    beforeEach inject ($injector) ->
      service = $injector.get 'userService'

    it 'should load', () ->
      expect(service.fooBar).toBeDefined()