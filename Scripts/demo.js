//require('./todo');
/*
process.nextTick(() => {
  console.log('1');
  const SweetieKit = require('std:sweetiekit.node');

});*/
/*
setTimeout(() => {
  console.log('2');
  const SweetieKit = require('std:sweetiekit.node');
}, 1000);
*/

const https = require('https');

console.log('https.get start');
https.get('https://testserver-rugwhbkbuu.now.sh/', (resp) => {
  let data = '';
  
  console.log('resp start');

  // A chunk of data has been recieved.
  resp.on('data', (chunk) => {
    console.log('data');
    data += chunk;
  });

  // The whole response has been received. Print out the result.
  resp.on('end', () => {
    console.log('end', data);
    console.log(JSON.parse(data));
    require('./app2.js');
  });
  console.log('resp hooked');

}).on("error", (err) => {
  console.log("Error: " + err.message);
  console.log(err.stack);
  throw err;
});
console.log('https.get end');

console.log('demo.js done');
