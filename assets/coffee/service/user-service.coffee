define [
  'config'
  'service/radian-service'
  'firebase-simple-login'
], (cfg, RS) ->
  class extends RS
    @register 'userService', [
      '$firebaseSimpleLogin'
      '$firebase'
    ]

    init: ($firebaseSimpleLogin) ->
      loginRef = new Firebase(cfg.firebaseUrl)
      @auth = @$firebaseSimpleLogin(loginRef)
      return

    login: (user) ->
      console.log "got to login"
      @auth.$login('password', user)

    register: (newUser) ->
      console.log "got to register"
      @auth.$createUser(newUser.email, newUser.password)
    logout: (user) ->
      console.log 'logout'
      @auth.$logout()
