(function () {
  "use strict";
  var PORT = process.env.PORT || 9292;

  var connect = require('connect');
  var serveStatic = require('serve-static');
  var http = require('http');

  var corsHeaders = function (req, res, next) {
    res.setHeader("Access-Control-Allow-Origin", "*");
    return next();
  };
  var staticKibana = serveStatic(__dirname + '/kibana', {'index': ['index.html']});

  var app = connect()
      .use(corsHeaders)
      .use(staticKibana);

  var server = http.createServer(app);
  server.listen(PORT, function () {
    console.log('server is listening on port ' + PORT + '.');
  });
})();
