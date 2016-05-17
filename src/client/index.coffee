cache = require './cache'
mouse = require './mouse'
tick = require './tick'
net = require './net'
renderer = require './renderer'

# инициализация
mouse.init()
renderer.init()

# if Math.random() > 0.5
cache.currentColor = '0x' + (Math.random() * 0xFFFFFF << 0).toString(16)
# else
  # cache.currentColor = '0xffffff'

# запускаем отрисовку
tick()

# инициализируем соединение позже, чтобы отрисовка не мешала пингу
setTimeout ->
  net.init()
, 750