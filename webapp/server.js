var express = require('express');
var request = require('superagent');
var app = express();
var bodyParser = require('body-parser')
var student=require('./routes/student');
var urlencodedParser = bodyParser.urlencoded({ extended: false })

app.set('port', (process.env.PORT || 5000));
app.set('view engine', 'ejs');
app.set('views', __dirname + '/public/views/');
app.use(express.static(__dirname + '/public'));
app.use('/student',student);

app.get('/', function(req, res){
  res.render('index');
})

app.get('/students', function(req, res){
  request

    .get('http://localhost:8080/api/getdepartments')
    .end(function(err, data) {
      console.log(data);
      if(data.status == 403){
        res.send(403, '403 Forbidden');
      } else {
        var departments = data.body;
        res.render('students', { departments: departments} );
      }
    })
})



app.get('/depts', function(req, res){
  request

    .get('http://localhost:8080/api/getdeptinfo')
    .end(function(err, data) {
      console.log(data);
      if(data.status == 403){
        res.send(403, '403 Forbidden');
      } else {
        var departments = data.body;
        res.render('deptinfo', { departments: departments} );
      }
    })
})

app.post('/studentlist', urlencodedParser,function(req, res){
    if (!req.body) return res.sendStatus(400)
    var ID = req.body;
  request
    .get('http://localhost:8080/api/getstudents_ByDept')
    .query(ID)
    .end(function(err, data) {
      console.log(data);
      if(data.status == 403){
        res.send(403, '403 Forbidden');
      } else {
        
        var students = data.body;
        console.log(students)
        res.render('studentlist', { students: students} );
      }
    })
    
})


app.post('/studentdetails', urlencodedParser,function(req, res){
    if (!req.body) return res.sendStatus(400)
    var ID = req.body;
  request
    .get('http://localhost:8080/api/getstudentdetails')
    .query(ID)
    .end(function(err, data) {
      console.log(data);
      if(data.status == 403){
        res.send(403, '403 Forbidden');
      } else {
        
        var details = data.body;
        console.log(details)
        res.render('studentdetails', { details: details} );
      }
    })
    
})


app.listen(app.get('port'), function() {
  console.log('Node app is running on port', app.get('port'));
});