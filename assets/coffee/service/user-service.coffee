define [
  'config'
  'service/radian-service'
  'firebase-simple-login'
], (cfg, RS) ->
  class extends RS
    @register 'userService', [
      '$firebaseSimpleLogin'
      '$firebase'
      '$rootScope'
    ]

    init: ($firebaseSimpleLogin, $firebase) ->
      @loginRef = new Firebase(cfg.firebaseUrl)
      @auth = @$firebaseSimpleLogin(@loginRef)
      @userRef = new Firebase("#{cfg.firebaseUrl}/users")
      @users = @loadUsers()
      @loadUserToRootScope()
      return

    login: (user) =>
      console.log "got to login"
      @auth.$login('password', user).then (authUser) =>
        @$rootScope.user = @users.$child(authUser.id)


    register: (newUser) ->
      console.log "got to register"
      @auth.$createUser(newUser.email, newUser.password).then (auth) =>
        console.log auth.user
        @users[auth.user.id] =
          email: newUser.email
          md5_hash: auth.user.md5_hash
          nickname: newUser.nickname
          team:
            id: newUser.team.$id
            name: newUser.team.name
            logo: newUser.team.logo
        @users.$save(auth.user.id).then () =>
          console.log "user saved"
          @login(newUser)

    logout: (user) ->
      console.log 'logout'
      @auth.$logout()
      @$rootScope.user = {}

    loadUserToRootScope: () ->
      @auth.$getCurrentUser().then (user) =>
        if user
          @$rootScope.user = @users.$child(user.id)

    getUserWithId: (id) ->
      @users.$child(id)

    getCurrentUser: () ->
      @auth.$getCurrentUser().then (auth) =>
        if auth
          return @getUserWithId(auth.id)
        else
          return null

    loadUsers: () ->
      @$firebase(@userRef)

    changeTeam: (team) ->
      @getCurrentUser().then (user) ->
        if user
          user.team.id = team.$id
          user.team.logo = team.logo
          user.$save()
        
