cache = require '../cache'

getPath = (path) ->
  cache.mousePath.push path

# export
module.exports = getPath