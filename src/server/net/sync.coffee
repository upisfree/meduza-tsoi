WebSocket = require 'ws'
# sharp = require 'sharp'
COMMANDS = require '../commands'
canvas = require '../canvas'
tmp = require '../tmp'

# синхронизация путей
sync = (socket) ->
  time = Date.now()

  # canvas.canvas.toBuffer (err, buf) ->
  #   sharp buf
  #     .resize 480, 360
  #     .crop()
  #     .png()
  #     .toBuffer (err, buf) ->
  #       console.log "#{Date.now() - time}ms"
  #       socket.send COMMANDS.SYNC + ',' + new Buffer(buf, 'binary').toString('base64')

  canvas.canvas.toDataURL 'image/png', (err, url) ->
    if err
      console.log err

    # console.log "sync, time: #{Date.now() - time}, length: #{url.length}"

    if socket.readyState is WebSocket.OPEN
      socket.send COMMANDS.SYNC + ',' + url

      # transparent

# export
module.exports = sync