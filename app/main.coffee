console.log "Hello, world!"

app = angular.module 'ld30App', []
app.controller 'MainController', ($scope) ->
  $scope.bees = 'eyes'

