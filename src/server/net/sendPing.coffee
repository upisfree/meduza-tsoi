cache = require '../cache'

ping = (socket) ->
  cache.pingTime = Date.now()
  socket.send cache.pingTime.toString()

# export
module.exports = ping