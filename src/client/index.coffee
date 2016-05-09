cache = require './cache'
mouse = require './mouse'
tick = require './tick'
net = require './net'
renderer = require './renderer'

# inits
mouse.init()
net.init()
renderer.init()

if Math.random() > 0.5
  cache.currentColor = '0x' + (Math.random() * 0xFFFFFF << 0).toString(16)
else
  cache.currentColor = '0xffffff'

# run the render loop
tick()