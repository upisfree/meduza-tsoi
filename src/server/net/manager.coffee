COMMANDS = require '../commands'
ping = require './ping'
getPath = require './path'

# каждая команда обозначается одним первым байтом в массиве
manager = (ws, buffer) ->
  array = new Uint16Array buffer
  commandByte = array[0]
  data = array.slice 1

  switch commandByte
    when COMMANDS.PING # ping
      ping data
    when COMMANDS.PATH # ping
      getPath data

# export
module.exports = manager