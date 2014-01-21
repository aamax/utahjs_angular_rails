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
    _classifieds.save(ad)

  deleteAd: (ad) ->
    _classifieds.delete(ad)

  getClassifieds: () ->
    _classifiedList

		
		
		
