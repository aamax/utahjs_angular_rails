classifiedCtrl = angular.module('myApp').controller('classifiedsCtrl', ($scope) ->
  $scope.hello = 'hi max'
)

classifiedCtrl.$inject = ["$scope"]