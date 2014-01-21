classifiedCtrl = angular.module('myApp').controller('classifiedsCtrl', ($scope, classifiedSvc) ->
  classifiedSvc.populateClassifieds()
  
  $scope.$on "loaded classifieds", ->
    $scope.classifieds = classifiedSvc.getClassifieds()

  $scope.deleteAd = (ad) ->
    # confirm: are you sure?
    classifiedsSvc.deleteAd(ad)

  $scope.editAd = (ad) ->
    $scope.currentAd = ad

  $scope.addNew = () ->
    $scope.currentAd = {name: 'unset', description: 'unset', phone: 'unset', image: 'unset', price: 0}

  $scope.saveAd = () ->
    classifiedsSvc.savAd($scope.currentAd)
)

classifiedCtrl.$inject = ["$scope", "classifiedSvc"]