elem =
  byId: (a) ->
    return document.getElementById a
  byClass: (a) ->
    return document.getElementsByClassName a
  byTag: (a) ->
    return document.getElementsByTagName a

# export
module.exports = elem