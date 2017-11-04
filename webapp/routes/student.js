var express = require('express');
var router = express.Router();
var url = require('url');
var bodyParser = require("body-parser");
var urlencodedParser = bodyParser.urlencoded({ extended: false })
var request = require('superagent');
 
router.get('/', function(req, res, next) {
  res.render('index', { title: 'EmeraldField Academy' });
});

router.get('/search', urlencodedParser,function(req, res){
    if (!req.body) return res.sendStatus(400)
    var phone = req.body;
    console.log(phone);
  request
    .get('http://localhost:8080/api/searchstudentdetails')
    .query(phone)
    .end(function(err, data) {
      console.log(data);
      if(data.status == 403){
        res.send(403, '403 Forbidden');
      } else {
        var studentdetails = data.body;
        var check = studentdetails.length ===0;

        if (check) {res.render('notfound');} 
        else {
        console.log(studentdetails)
        res.render('studentdetails', { studentdetails: studentdetails} );
      }
    }
    
})
})


router.get('/new', function(req, res){
    
  res.render('addstudent', { title: 'Add New student data' } );
      
    });
    




router.post('/new', urlencodedParser,function(req, res){
    if (!req.body) return res.sendStatus(400)
    var insertvalues = req.body;
    console.log(insertvalues);
  request
    .post('http://localhost:8080/api/addstudent')
    .send(insertvalues)
    .end(function(err, data) {
     
        var studentId = data.body;
        console.log(studentId)
        res.render('signupsuccess', { studentId: studentId} );
      
    })
    
})

router.post('/edit', urlencodedParser,function(req, res){
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
        res.render('edit', { details: details} );
      }
    })
    
})

router.post('/update', urlencodedParser,function(req, res){
    if (!req.body) return res.sendStatus(400)
    var data = req.body;
  request

    .put('http://localhost:8080/api/updatestudent/')
    .send(data)
    .end(function(err, data) {
      console.log(data);
      if(data.status == 403){
        res.send(403, '403 Forbidden');
      } else {
        
        var details = data.body;
        console.log(details)
        res.render('success', { details: details}  );
      }
    })
    
})




router.post('/delete', urlencodedParser,function(req, res){
    if (!req.body) return res.sendStatus(400)
    var studentId = req.body;
    console.log(studentId);
  request
    .del('http://localhost:8080/api/delete')
    .send(studentId)
    .set('Accept', 'application/json')
    .end(function(err, data) {
      console.log(data);
      if(data.status == 403){
        res.send(403, '403 Forbidden');
      } else {
        
        var details = data.body;
        console.log(details)
        res.render('deletesuccess', { details: details}  );
      }
    })    
})



















module.exports = router;