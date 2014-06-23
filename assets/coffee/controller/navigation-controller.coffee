define [
  'controller/radian-controller'
], (RC) ->
  class extends RC
    @register 'NavigationController', [
      '$scope'
    ]

    init: () ->