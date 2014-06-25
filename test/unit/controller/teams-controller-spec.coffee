define [
  'config'
  'angular'
  'controller/teams-controller'
], (cfg, A) ->
  describe 'Teams controller', () ->
    $scope = null
    createController = null

    beforeEach module cfg.ngApp

    beforeEach inject ($injector) ->
      $controller = $injector.get '$controller'
      $rootScope = $injector.get '$rootScope'

      $scope = $rootScope.$new()

      createController = () ->
        $controller 'TeamsController',
          $scope: $scope

    it 'should load', () ->
      controller = createController()