# A pretty [standard AngularJS ngRoute](http://docs.angularjs.org/api/ngRoute.$routeProvider) set up.
define [
  # Jump to [`config.coffee`](config.html) ☛
  'config'
  'angular'
  ], (cfg, A) ->
  routes = ($routeProvider, $locationProvider) ->
    $routeProvider
      .when '/teams',
        templateUrl: "#{cfg.path.partial}teams-partial.html"

      .when '/profile/:userId',
        templateUrl: "#{cfg.path.partial}user-profile-partial.html"

      .when '/profile',
        templateUrl: "#{cfg.path.partial}user-profile-partial.html"

      .when '/matches',
        templateUrl: "#{cfg.path.partial}matches-partial.html"

      .when '/',
        templateUrl: "#{cfg.path.partial}home-partial.html"

    $routeProvider.otherwise
      redirectTo: '/'

    $locationProvider.html5Mode true

  routes.$inject = [
    '$routeProvider'
    '$locationProvider'
  ]

  app = A.module cfg.ngApp
  app.config routes