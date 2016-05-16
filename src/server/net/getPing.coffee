cache = require '../cache'

ping = (value) ->
  console.log Date.now() - cache.pingTime, value

# export
module.exports = ping