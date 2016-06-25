tmp = require './tmp'
mouse = require './mouse'
tick = require './tick'
net = require './net'
initCanvas = require './utils/initCanvas'

# инициализация
mouse.init()
initCanvas()

# запускаем отрисовку
requestAnimationFrame tick

# инициализируем соединение позже, чтобы отрисовка не мешала пингу
setTimeout ->
  net.init()
, 750