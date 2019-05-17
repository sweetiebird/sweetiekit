const io = require('socket.io-client');
let socket;

function make() {
  socket = io.connect("https://sockets-yqjmfgkeuw.now.sh", {
    reconnection: true
  });

  socket.on('connect', function () {
    console.log('connected to localhost:3000');
    socket.on('clientEvent', function (data) {
      console.log('message from the server:', data);
      socket.emit('serverEvent', "thanks server! for sending '" + data + "'");
    });
  });

  return undefined;
}

module.exports = make;

