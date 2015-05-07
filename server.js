var express = require('express');
var path = require("path");
var port = process.env.PORT || 3000;

var app = express();

app.use(express.static(path.join(__dirname)));

app.get('/', function (req, res) {
  res.sendFile('index.html');
});

app.listen(port);
console.log('Server listening ...');