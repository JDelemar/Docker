// load the http module to create an http server
var http = require('http');

// configure the http server to respond with hello world to all requests
var server = http.createServer(function (request, response) {
    response.writeHead(200, {'Content-Type': 'text/plain'});
    response.end('Hello from Site 2');
});

// listen on port 8001
server.listen(8001);

// put a message on the terminal
console.log('Server running at http://127.0.0.1:8001');
