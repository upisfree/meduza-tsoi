COMMANDS = require '../commands'
ping = require './ping'
getPath = require './path'

# первое число массива — это команда
manager = (ws, data) ->
  array = data.split ','
  command = +array[0]
  values = array[1..]

  switch command
    when COMMANDS.PING
      ping values
    when COMMANDS.PATH
      getPath values

# export
module.exports = manager