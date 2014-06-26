define [
  'controller/radian-controller'
  'service/user-service'
  'service/team-service'
], (RC) ->
  class extends RC
    @register 'UserProfileController', [
      '$scope'
      '$rootScope'
      'userService'
      'teamService'
      '$routeParams'
    ]

    init: () ->
      # Get the correct user
      if @$routeParams.userId
        @$scope.profileUser = @userService.getUserWithId(@$routeParams.userId)
        console.log @$scope.profileUser.md5_hash
      else
        @$scope.profileUser = @$rootScope.user
        @$scope.isPersonalProfilePage = @$rootScope.user != {}
      @$rootScope.$watch 'user', (user) =>
        if @$scope.isPersonalProfilePage
          @$scope.profileUser = @$rootScope.user
        if user
          if @$routeParams.userId
            @$scope.isPersonalProfilePage = @$routeParams.userId == user.$id
          else
            @$scope.isPersonalProfilePage = @$rootScope.user != {}
      @$scope.teams = @teamService.teams