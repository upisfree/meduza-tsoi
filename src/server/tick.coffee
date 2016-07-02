prettyBytes = require 'pretty-bytes'
tmp = require './tmp'
canvas = require './canvas'

tick = ->
  # рисуем то, что пришло с клиентов
  ctx = canvas.ctx

  for path in tmp.paths
    p = path[0]
    for v, k in p by 2
      if p[k] > 0 and p[k + 1] > 0 and p[k + 2] > 0 and p[k + 3] > 0
        ctx.beginPath()
        ctx.moveTo parseInt(p[k], 10), parseInt(p[k + 1], 10)
        ctx.lineTo parseInt(p[k + 2], 10), parseInt(p[k + 3], 10)
        ctx.strokeStyle = path[1]
        ctx.stroke()
        ctx.closePath()

  tmp.paths = []

  # готовим холст к отправке клиентам
  canvas.canvas.toDataURL 'image/jpg', (err, url) ->
    if err
      console.log err

    m = process.memoryUsage()
    console.log prettyBytes m.heapUsed

    tmp.canvasBase64 = url

  # canvas.canvas.toBuffer (err, buf) ->
  #   sharp buf
  #     .resize 480, 360
  #     .crop()
  #     .png()
  #     .toBuffer (err, buf) ->
  #       console.log "#{Date.now() - time}ms"
  #       socket.send COMMANDS.SYNC + ',' + new Buffer(buf, 'binary').toString('base64')

# export
module.exports = tick