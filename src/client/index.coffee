tmp = require './tmp'
mouse = require './mouse'
tick = require './tick'
net = require './net'
initCanvas = require './utils/initCanvas'

# инициализация
mouse.init()
initCanvas()

# if Math.random() > 0.5
tmp.currentColor = '#' + (Math.random() * 0xFFFFFF << 0).toString(16)
ctx.fillStyle = tmp.currentColor
ctx.strokeStyle = tmp.currentColor
# else
  # tmp.currentColor = '0xffffff'

# запускаем отрисовку
requestAnimationFrame tick

# инициализируем соединение позже, чтобы отрисовка не мешала пингу
setTimeout ->
  net.init()
, 750