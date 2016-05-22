tmp = require '../tmp'
path = require './path'
debug = require '../debug'

interval = (socket) ->
  clearInterval tmp.syncInterval

  debug.setPing tmp.ping

  tmp.syncInterval = setInterval ->
    path socket
  , tmp.ping

# export
module.exports = interval