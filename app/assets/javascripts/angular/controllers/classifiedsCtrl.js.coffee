angular.module 'myApp', ["ngResource", "ng-rails-csrf"]

angular.module('myApp').factory "classifiedSvc", ($rootScope, $resource, $http) ->
  _classifieds = $resource("/classifieds/:id", {id: "@id"}, {update: {method: "PUT"}})
  _classifiedList = []

  populateClassifieds: () ->
    $http(
      method: "GET"
      url: "/classifieds/"
      cache: false
    ).success((data, status, headers, config) ->
      _classifiedList = data
      $rootScope.$broadcast('loaded classifieds')
    ).error (data, status, headers, config) ->
      console.log "error " + status
      console.log "error:data " + data
      alert('Error Will Robinson!')
      _classifiedList = []

  saveAd: (ad) ->
    if ad.id
      _classifieds.update(ad)
    else
      _classifieds.save(ad)

  deleteAd: (ad) ->
    _classifieds.delete(ad)

  getClassifieds: () ->
    _classifiedList




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