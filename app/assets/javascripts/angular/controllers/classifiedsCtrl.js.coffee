classifiedCtrl = angular.module('myApp').controller('classifiedsCtrl', ($scope, classifiedSvc) ->
  classifiedSvc.populateClassifieds()
  
  $scope.$on "loaded classifieds", ->
    $scope.classifieds = classifiedSvc.getClassifieds()

  $scope.deleteAd = (ad) ->
    alert('deleting')

  $scope.editAd = (ad) ->
    alert('editing')

  $scope.addAd = () ->
    alert('adding')
)

classifiedCtrl.$inject = ["$scope", "classifiedSvc"]