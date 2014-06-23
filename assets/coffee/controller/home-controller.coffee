define [
  'controller/radian-controller'
], (RC) ->
  class extends RC
    @register 'HomeController', [
      '$scope'
    ]

    init: () ->