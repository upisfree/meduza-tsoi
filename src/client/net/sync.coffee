tmp = require '../tmp'

sync = (data) ->
  tmp.syncData = data[2..]

# export
module.exports = sync