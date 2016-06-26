tmp = require '../tmp'
sync = require './sync'

path = (path, socket) ->
  if path.length
    tmp.mousePath.push [socket._color, path.join()]

  if tmp.mousePath.length > 5
    tmp.mousePath.splice 1, 1

  sync socket

# export
module.exports = path