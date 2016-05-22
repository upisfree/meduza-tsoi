COMMANDS = require '../commands'
ping = require './ping'
path = require './path'

# первое число массива — это команда
manager = (data, socket) ->
  array = data.split ','
  command = +array[0]
  values = array[1..]

  switch command
    when COMMANDS.PING
      ping values, socket
    when COMMANDS.PATH
      path values, socket

# export
module.exports = manager