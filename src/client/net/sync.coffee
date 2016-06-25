tmp = require '../tmp'

sync = (data) ->
  tmp.syncData = data[2..]
  # tmp.syncData = 'data:image/jpeg;base64,' + data[2..]
  # moved rendering to tick.coffee, as it must be

# export
module.exports = sync