define [
  'config'
  'angular'
  'directive/register-directive'
], (cfg, A) ->
  describe 'Register directive', () ->
    $httpBackend = null
    $scope = null
    createDirective = null
    el = A.element '<div data-register data-ng-model="dataItems"></div>'

    beforeEach module cfg.ngApp

    beforeEach inject ($injector) ->
      $compile = $injector.get '$compile'
      $httpBackend = $injector.get '$httpBackend'
      $rootScope = $injector.get '$rootScope'

      $compiled = $compile el
      $scope = $rootScope.$new()

      createDirective = () ->
        $compiled $scope

    afterEach () ->
      $httpBackend.verifyNoOutstandingExpectation()
      $httpBackend.verifyNoOutstandingRequest()

    data = [1, 2, 3, 4]

    it 'should load', () ->
      $httpBackend.expectGET(cfg.path.partial + 'directive/register-partial.html').respond 201, """
      <div class="register-component">
        <ul>
          <li data-ng-repeat="item in items">
            {{item}}
          </li>
        </ul>
      </div>"""

      directive = createDirective()

      $httpBackend.flush()

      $scope.dataItems = data
      $scope.$digest()

      expect(el.find('li').length).toBe data.length