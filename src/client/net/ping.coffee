pong = require './pong'

ping = (data, socket) ->
  pong.send data, socket

# export
module.exports = ping