cache = require '../cache'

sync = (data) ->
  cache.syncPath = data.slice()
  # console.log data

# export
module.exports = sync