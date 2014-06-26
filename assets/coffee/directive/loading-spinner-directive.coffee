define [
  'config'
  'directive/radian-directive'
], (cfg, RD) ->
  RD 'loadingSpinner', [
    '$rootScope'
  ], ($rootScope) ->
    templateUrl: cfg.path.partial + 'directive/loading-spinner-partial.html'
    restrict: 'A'
    replace: true
    transclude: true
    scope:
      loading: '=loadingSpinner'
    link: ($scope, $element, $attrs) ->