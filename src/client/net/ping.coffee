# ping =
#   send: ->
#     ping.data = concat 0, new Int16Array 32
#     ping.time = Date.now()

#     net._socket.send ping.data
#   onmessage: (data) ->
#     if ping.data.length is new Int16Array(data).length
#       ping.val = Date.now() - ping.time

#       console.log ping.val
#     else
#       console.log 'ping error'
#   data: null
#   time: null
#   val: null

ping = (data, socket) ->
  socket.send data
  console.log data

# export
module.exports = ping