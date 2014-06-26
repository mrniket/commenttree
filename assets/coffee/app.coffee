# This is the base config for the app. Before [AngularJS](http://angularjs.org) is init'd the app uses
# [RequireJS](http://requirejs.org) to get the juices flowing and the dependancies loaded.
require.config
  baseUrl: '/assets/js/'
  paths:
    'jquer': '../vendor/jquery/dist/jquery.min'
    'bootstrap': '../vendor/bootstrap/dist/js/bootstrap.min'
    'angular': '../vendor/angular/angular'
    'angular-animate': '../vendor/angular-animate/angular-animate'
    'angular-resource': '../vendor/angular-resource/angular-resource'
    'angular-route': '../vendor/angular-route/angular-route'
    'lodash': '../vendor/lodash/dist/lodash'
    'firebase': '../vendor/firebase/firebase'
    'angularfire': '../vendor/angularfire/angularfire.min'
    'firebase-simple-login': '../vendor/firebase-simple-login/firebase-simple-login'
    'angular-ui-bootstrap' : '../vendor/angular-bootstrap/ui-bootstrap-tpls.min'
    # 'spin': '../vendor/spin.js/spin'
    'angular-spinkit': '../vendor/angular-spinkit/build/angular-spinkit'
  shim:
    'angular':
      deps: [
        'jquer'
      ]
      exports: 'angular'
    'lodash':
      exports: '_'
    'angularfire':
      deps: [
        'angular'
        # 'spin'
        'firebase'
      ]
    'firebase-simple-login':
      deps: [
        'angular'
        'firebase'
        'angularfire'
      ]

# Jump to [`startup.coffee`](startup.html) ☛
require ['startup']