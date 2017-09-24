// // load the http module to create an http server
// var http = require('http');

// // configure the http server to respond with hello world to all requests
// var server = http.createServer(function (request, response) {
//     response.writeHead(200, {'Content-Type': 'text/plain'});
//     response.end('Hello from Site 2');
// });

// // listen on port 8001
// server.listen(8001);

var https = require('https'),
    pem = require('pem'); // needs openssl

pem.createCertificate({days:1, selfSigned:true}, function(err, keys){
    https.createServer({key: keys.serviceKey, cert: keys.certificate}, function(request, response){
        response.writeHead(200, {'Content-Type': 'text/plain'});
        response.end('Hello from Site 2');
    }).listen(8001);
});

// put a message on the terminal
console.log('Server running at https://127.0.0.1:8001');
