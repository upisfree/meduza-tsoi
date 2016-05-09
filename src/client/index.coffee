mouse = require './mouse'
tick = require './tick'
net = require './net'
renderer = require './renderer'

# inits
mouse.init()
net.init()
renderer.init()

# run the render loop
tick()