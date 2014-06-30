define [
  'controller/radian-controller'
  'service/user-service'
  'service/team-service'
  'directive/loading-spinner-directive'
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
      @$scope.viewLoading = true
      @loadCorrectUser()
      @$scope.teams = @teamService.teams
      @$scope.changeTeam = @changeTeam

    loadCorrectUser: () ->
      @userService.getCurrentUser().then (currentUser) =>
        # Get the correct user
        if @$routeParams.userId
          user = @userService.getUserWithId(@$routeParams.userId)
          if user.email
            @$scope.profileUser = user
            @isPersonalProfile(user)
          else
            @$scope.profileUser = {
              nickname: "User not found, sorry"
            }
        else
          if currentUser
            console.log currentUser
            @$scope.profileUser = @userService.getUserWithId(currentUser.$id)
            @$scope.isPersonalProfilePage = true
          else
            @$scope.profileUser = {
              nickname: "Please log in to access your profile"
            }
          
        @$scope.viewLoading = false
      
    isPersonalProfile: (user) ->
      if user
        if @$routeParams.userId
          @$scope.isPersonalProfilePage = @$routeParams.userId == user.$id
        else
          @$scope.isPersonalProfilePage = @$rootScope.user != {}

    changeTeam: (team) =>
      # if user can run this function, I assume they are on their perosnal profile page
      @userService.changeTeam(team)
      return