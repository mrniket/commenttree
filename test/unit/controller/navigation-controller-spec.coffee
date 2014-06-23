define [
  'config'
  'angular'
  'controller/navigation-controller'
], (cfg, A) ->
  describe 'Navigation controller', () ->
    $scope = null
    createController = null

    beforeEach module cfg.ngApp

    beforeEach inject ($injector) ->
      $controller = $injector.get '$controller'
      $rootScope = $injector.get '$rootScope'

      $scope = $rootScope.$new()

      createController = () ->
        $controller 'NavigationController',
          $scope: $scope

    it 'should load', () ->
      controller = createController()