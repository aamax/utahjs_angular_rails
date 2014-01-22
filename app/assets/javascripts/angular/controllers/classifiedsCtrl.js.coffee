classifiedCtrl = angular.module('myApp').controller('classifiedsCtrl', ($scope, classifiedSvc) ->
  classifiedSvc.populateClassifieds()
  
  $scope.$on "loaded classifieds", ->
    $scope.classifieds = classifiedSvc.getClassifieds()

  $scope.deleteAd = (ad) ->
    # confirm: are you sure?
    classifiedSvc.deleteAd(ad)
    classifiedSvc.populateClassifieds()

  $scope.editAd = (ad) ->
    $scope.currentAd = ad

  $scope.addNew = () ->
    # adjust array
    $scope.currentAd = {name: 'unset', description: 'unset', phone: 'unset', image: 'unset', price: 0}


  $scope.saveAd = () ->
    bIsNew = ($scope.currentAd.id == undefined)

    classifiedSvc.saveAd($scope.currentAd)
    if bIsNew
      classifiedSvc.populateClassifieds()
    $('#newAd').modal('hide')

)

classifiedCtrl.$inject = ["$scope", "classifiedSvc"]