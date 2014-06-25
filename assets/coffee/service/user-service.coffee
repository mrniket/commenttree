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
      @users = @$firebase(@userRef)
      @loadUserToRootScope()
      return

    login: (user) =>
      console.log "got to login"
      @hello = "hello"
      @auth.$login('password', user).then (authUser) =>
        @$rootScope.user = @users.$child(authUser.uid)


    register: (newUser) ->
      console.log "got to register"
      @auth.$createUser(newUser.email, newUser.password).then (user) =>
        @users[user.uid] =
          email: newUser.email
          md5_hash: user.md5_hash
          nickname: newUser.nickname
          team: newUser.team
        @users.$save(user.uid).then () =>
          console.log "user saved"
          @login(newUser)

    logout: (user) ->
      console.log 'logout'
      @auth.$logout()
      @$rootScope.user = {}

    loadUserToRootScope: () ->
      @auth.$getCurrentUser().then (user) =>
        if user
          @$rootScope.user = @users.$child(user.uid)
        
