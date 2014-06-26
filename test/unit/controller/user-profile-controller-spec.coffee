define [
  'config'
  'angular'
  'controller/user-profile-controller'
], (cfg, A) ->
  describe 'User profile controller', () ->
    $scope = null
    createController = null

    beforeEach module cfg.ngApp

    beforeEach inject ($injector) ->
      $controller = $injector.get '$controller'
      $rootScope = $injector.get '$rootScope'

      $scope = $rootScope.$new()

      createController = () ->
        $controller 'UserProfileController',
          $scope: $scope

    it 'should load', () ->
      controller = createController()