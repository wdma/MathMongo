const express = require('express')
const app = express()
var MongoClient = require('mongodb').MongoClient;
var url = "mongodb://localhost:27017/Fay"
var ejs = require('ejs')

app.set('view engine', 'ejs');

var queryPage = ejs.compile('./query.ejs')
var CDFPage = ejs.compile('./CDF.ejs')

app.get('/', function (req,res,next)
 {try
    {
      res.send("There are two possible paths from here:  1) A query should be entered somewhere on this page and then the user redirected to get the answer from ~/JSONendpoint. This currently works with a fixed query.  2) The user should be able to interact with the data via an embedded CDF.")
    }
  catch (e)
    {
      next(e)
    }
 })

var query = {"authors.author_name":"Megala Simmons, A."};

app.get('/JSONendpoint', function (req,res,next)
   {MongoClient.connect(url,
   function(err,db)
     {if(err) throw err;
      db.collection('records').find(query).toArray(
      function(err,result)
       {if (err) throw err;
        var obj = result;
        res.send(obj);
       });
       db.close();
     });
   });

function myFunction(req,res,next)
   {MongoClient.connect(url,
   function(err,db)
     {if(err) throw err;
      db.collection('records').find(query).toArray(
      function(err,result)
       {if (err) throw err;
        var obj = result;
        res.send(obj);
       });
       db.close();
     });
   };


//The above function (/JSONenpoint) works, but employs a fixed query.  This section attempts to allow the user to define a strict MongoDB query into an input box.  As above, the data are available at /JSONendpoint
app.get('/queryPage', function (req,res,next)
 {try
  {
  res.render('./query.ejs')
  }
  catch (e)
  {
   next(e)
  }
 })

//This function generates a webpage for the user to interact with a CDF.
app.get('/CDFendpoint', function (req,res,next)
 {try
  {
  res.render('./CDF.ejs')
  }
  catch (e)
  {
   next(e)
  }
 })

app.listen(3000, function () {
  console.log('Example app listening on port 3000!')
})

