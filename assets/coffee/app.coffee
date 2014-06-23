# This is the base config for the app. Before [AngularJS](http://angularjs.org) is init'd the app uses
# [RequireJS](http://requirejs.org) to get the juices flowing and the dependancies loaded.
require.config
  baseUrl: '/assets/js/'
  paths:
    'angular': '../vendor/angular/angular'
    'angular-animate': '../vendor/angular-animate/angular-animate'
    'angular-resource': '../vendor/angular-resource/angular-resource'
    'angular-route': '../vendor/angular-route/angular-route'
    'lodash': '../vendor/lodash/dist/lodash'
    'firebase': '../vendor/firebase/firebase'
    'angularfire': '../vendor/angularfire/angularfire.min'
    'firebase_simple_login': '..vendor/firebase_simple_login/firebase_simple_login'
    'bootstrap': '../vendor/bootstrap/dist/js/bootstrap.min'
  shim:
    'angular':
      exports: 'angular'
    'lodash':
      exports: '_'

# Jump to [`startup.coffee`](startup.html) ☛
require ['startup']