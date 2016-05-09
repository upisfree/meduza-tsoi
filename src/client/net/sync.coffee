cache = require '../cache'

sync = (data) ->
  cache.syncPath = data

# export
module.exports = sync