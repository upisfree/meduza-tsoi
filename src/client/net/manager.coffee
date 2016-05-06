COMMANDS = require '../commands'
ping = require './ping'
sync = require './sync'

# каждая команда обозначается одним первым байтом в массиве
manager = (buffer) ->
  array = new Uint16Array buffer
  commandByte = array[0]
  data = array.slice 1

  switch commandByte
    when COMMANDS.PING # ping
      ping data
    when COMMANDS.SYNC # ping
      sync data

# export
module.exports = manager