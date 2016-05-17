cache = require '../cache'
path = require './path'

interval = (socket) ->
  clearInterval cache.syncInterval

  console.log cache.ping

  cache.syncInterval = setInterval ->
    path socket
  , cache.ping

# export
module.exports = interval