config = require '../config'
fullSync = require './full'
sync = require './sync'

interval = (socket) ->
  clearInterval socket._fullSyncInterval
  clearInterval socket._syncInterval

  socket._fullSyncInterval = setInterval ->
    fullSync socket
  , config.period.fullSync

  socket._syncInterval = setInterval ->
    sync socket
  , socket._ping

# export
module.exports = interval