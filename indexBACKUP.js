const express = require('express')
const app = express()
var gulp = require('gulp');
var nunjucksRender = require('gulp-nunjucks-render');
var http = require('http');
var MongoClient = require('mongodb').MongoClient;
var url = "mongodb://localhost:27017/Fay"

app.get('/', function (req,res,next)
 {try
    {
      res.send("This is the main page.  The query should be entered somewhere here and then the user redirected to get the answer from ~/JSONendpoint")
    }
  catch (e)
    {
      next(e)
    }
 })

var query = {"authors.author_name":"Megala Simmons, A."};
 
app.get('/JSONendpoint', function (req, res)
  {MongoClient.connect("mongodb://localhost:27017/Fay",
   function(err,db)
     {if(err) throw err;
      db.collection('records').find(query).toArray(
      function(err,result)
       {if (err) throw err;
        var obj = result;
        var lookup = '_id';
        res.send(obj);
       });
       db.close();
     });
  })

app.listen(3000, function () {
  console.log('Example app listening on port 3000!')
})

