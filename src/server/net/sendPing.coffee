cache = require '../cache'

ping = (socket) ->
  cache.pingTime = Date.now()
  socket.send '00000000000000000000000000000000000000000000000000000000000000000'

# export
module.exports = ping