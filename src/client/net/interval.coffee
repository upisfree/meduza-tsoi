tmp = require '../tmp'
path = require './path'

interval = (socket) ->
  clearInterval tmp.syncInterval

  console.log tmp.ping

  tmp.syncInterval = setInterval ->
    path socket
  , tmp.ping

# export
module.exports = interval