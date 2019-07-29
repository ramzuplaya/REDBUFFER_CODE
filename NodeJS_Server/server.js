const express = require('express');
const mysql = require('mysql');
const bodyParser = require('body-parser');
const cors = require('cors');
const multer = require('multer');


const app = express();

//HANDLE JSON OBJECTS
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}) );

//ENABLE CORS
app.use(cors());

// Create connection
const db = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : '',
    database : 'songsdb'   //if songsdb.sql file is not imported then when running first time comment this line ,after creating database uncomment it and specify your db name
    
    
});



// Connect
db.connect((err) => {
    if(err){
        throw err;
    }
    console.log('MySql Connected...');
});

//File Storage

const DIR = '../src/assets/songfiles';
 
let storage = multer.diskStorage({
    destination: (req, file, cb) => {
      cb(null, DIR);
    },
    filename: (req, file, cb) => {
      cb(null, file.originalname);
    }
});
let upload = multer({storage: storage});

app.post('/upload',upload.single('upload'), function (req, res) {
    if (!req.file) {
        console.log("No file received");
        return res.send({
          success: false
        });
    
      } else {
        console.log('file received successfully');
        return res.send({
          success: true
        })
      }
});

// Create DB
app.get('/createdb', (req, res) => {
    let sql = 'CREATE DATABASE songsdb';
    db.query(sql, (err, result) => {
        if(err) throw err;
        console.log(result);
        res.send('Database created...');
    });
});

//Create table
app.get('/createsongstable',(req,res) => {
    let sql = 'CREATE TABLE SONGS(id int  AUTO_INCREMENT,name varchar(100),artist varchar(100),genre varchar(50),length varchar(10),PRIMARY KEY (id))';
    db.query(sql,(err,result)=>{
        if (err) throw err;
        res.send(result);
        console.log(result);
    })
})

//Insert Songs
app.post('/insertsongstable',(req,res) => {
    debugger;
    var name,artist,genre,length;
    name = req.body.name;
    artist = req.body.artist;
    genre = req.body.genre;
    length = req.body.length;
    console.log(name);
    let sql = "INSERT INTO SONGS(name,artist,genre,length) VALUES ('"+name+"','"+artist+"','"+genre+"','"+length+"')";
    db.query(sql,(err,result)=>{
        if (err) throw err;
        res.send(result);
        console.log(result);
    })
})

//Get all Songs
app.get('/getallsongs',(req,res) => {
    let sql = "SELECT name , artist, genre FROM SONGS";
    db.query(sql,(err,result)=>{
        if (err) throw err;
        res.send(JSON.stringify(result));
        console.log(result);
    })
})

app.listen('3000', ()=> {
    console.log('Server started on port 3000');
})