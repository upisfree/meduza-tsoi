var generateId, generateRandomString, tmp;

tmp = require('../tmp');

generateRandomString = require('./generateRandomString');

generateId = function() {
  var id;
  id = generateRandomString(8);
  if (!tmp.clients[id]) {
    return id;
  } else {
    return generateId();
  }
};

module.exports = generateId;
