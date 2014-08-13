FIREBASE_WORLD_ROOT = 'https://ld30-warmup-alynn.firebaseio.com/world'
FIREBASE_ENV_ROOT = 'https://ld30-warmup-alynn.firebaseio.com/env/game1'

console.log "Hello, world!"

app = angular.module 'ld30App', ['ngRoute', 'firebase']

app.config ['$routeProvider', ($routeProvider) ->
  $routeProvider.when '/', templateUrl: 'views/root.html'
  $routeProvider.when '/bees', templateUrl: 'views/bees.html']

app.controller 'MainController', ($scope, $firebase) ->
  fbWorld = new Firebase(FIREBASE_WORLD_ROOT)
  fbWorldSync = $firebase(fbWorld)
  fbWorldObj = fbWorldSync.$asObject()
  fbWorldObj.$bindTo $scope, 'world'

  fbEnv = new Firebase(FIREBASE_ENV_ROOT)
  fbEnvSync = $firebase(fbEnv)
  fbEnvObj = fbEnvSync.$asObject()
  fbEnvObj.$bindTo $scope, 'env'

  $scope.locGoTo = (newLocation) ->
    $scope.env.location = newLocation

  # Some environment initialisation

