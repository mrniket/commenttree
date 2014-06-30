define [
  'config'
  'angular'
  'controller/matches-controller'
], (cfg, A) ->
  describe 'Matches controller', () ->
    $scope = null
    createController = null

    beforeEach module cfg.ngApp

    beforeEach inject ($injector) ->
      $controller = $injector.get '$controller'
      $rootScope = $injector.get '$rootScope'

      $scope = $rootScope.$new()

      createController = () ->
        $controller 'MatchesController',
          $scope: $scope

    it 'should load', () ->
      controller = createController()