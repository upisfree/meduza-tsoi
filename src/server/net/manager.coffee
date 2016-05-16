COMMANDS = require '../commands'
ping = require './getPing'
path = require './path'

# первое число массива — это команда
manager = (socket, data) ->
  array = data.split ','
  command = +array[0]
  values = array[1..]

  switch command
    when COMMANDS.PING
      ping array
    when COMMANDS.PATH
      path values

# export
module.exports = manager