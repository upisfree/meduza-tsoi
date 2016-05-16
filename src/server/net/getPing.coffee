cache = require '../cache'

ping = (value) ->
  console.log Date.now() - value

# export
module.exports = ping