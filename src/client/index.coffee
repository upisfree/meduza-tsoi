initCanvas = require './utils/initCanvas'
getContext = require './utils/getContext'
mouse = require './mouse'
tick = require './tick'
net = require './net'

initCanvas()
mouse.init()
net.init()

requestAnimationFrame tick

# cache = require './cache'

# setInterval ->
#   console.log cache.mousePath
# , 1000