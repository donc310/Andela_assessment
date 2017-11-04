//API dependencies
var express = require('express');
var jwt = require('express-jwt');
var rsaValidation = require('auth0-api-jwt-rsa-validation');
var path = require('path');
var favicon = require('serve-favicon');
var logger = require('morgan');
var bodyParser = require('body-parser');
var mysql = require('mysql');
var connection = require("express-myconnection");


var Api=require('./routes/api');
var routes = require('./routes/index');

var app = express();


app.set('port', (process.env.PORT || 8080));
//db connection

app.use(connection(mysql, {
host: "localhost",
user: "",
password: "",
database: "emeraldfeild_db"
},'request'));

console.log(rsaValidation());

//Validate tokens for the API 
// this would perform aythentication for the api in future development
var jwtCheck = jwt({
  secret: rsaValidation(),
  algorithms: ['RS256'],
  issuer: "https://YOUR-AUTH0-DOMAIN.auth0.com/",
  audience: 'YOUR-API-IDENTIFIER'
});
//set a simple view to interface with API
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');

//app.use(jwtCheck);
app.use(function (err, req, res, next) {
  if (err.name === 'UnauthorizedError') {
    res.status(401).json({message:'Missing or invalid token'});
  }
});
app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', routes);
// main api endpoints
app.use('/Api',Api);




app.use(function(req, res, next) {
  var err = new Error('Not Found');
  err.status = 404;
  next(err);
});

// error handlers

// development error handler
// will print stacktrace
if (app.get('env') === 'development') {
  app.use(function(err, req, res, next) {
    res.status(err.status || 500);
    res.render('error', {
      message: err.message,
      error: err
    });
  });
}

// production error handler
// no stacktraces leaked to user
app.use(function(err, req, res, next) {
  res.status(err.status || 500);
  res.render('error', {
    message: err.message,
    error: {}
  });
});

app.listen(app.get('port'), function() {
  console.log('Node app is running on port', app.get('port'));
  });
