COMMANDS = require '../commands'
pong = require './pong'
path = require './path'

# первое число массива — это команда
manager = (data, socket) ->
  array = data.split ','
  command = +array[0]
  values = array[1..]

  switch command
    when COMMANDS.PONG
      pong values[0], socket
    when COMMANDS.PATH
      path values

# export
module.exports = manager