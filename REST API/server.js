const express = require("express");
const  pool  = require("./dbConfig");
const bcrypt = require("bcrypt");
const passport = require("passport");

const multer= require('multer');



const session = require("express-session");
require("dotenv").config();
const app = express();


app.use(express.json()) 
app.use(express.static('./uploads'));

const PORT = process.env.PORT || 3000;

const initializePassport = require("./passportConfig");
const path=require('path');

initializePassport(passport);


//app.set("view engine", "ejs");

const userImageStorage=multer.diskStorage({
  destination:'./uploads/user_images',
  filename: function(req, file, cb){
    //  cb(null,file.fieldname+'-'+Date.now()+file.originalname);
    cb(null,file.fieldname+'-'+file.originalname);
  }
});

const userPoststorage=multer.diskStorage({
  destination:'./uploads/posts',
  filename: function(req, file, cb){
    //  cb(null,file.fieldname+'-'+Date.now()+file.originalname);
    cb(null,file.fieldname+'-'+file.originalname);
  }
});

const userStoriesStorage=multer.diskStorage({
  destination:'./uploads/stories',
  filename: function(req, file, cb){
    //  cb(null,file.fieldname+'-'+Date.now()+file.originalname);
    cb(null,file.fieldname+'-'+file.originalname);
  }
});

const uploadUserImage=multer({
  storage: userImageStorage
}).single('profileImage');

const uploadPostImage=multer({
  storage: userImageStorage
}).single('postImage');

const uploadStoryImage=multer({
  storage: userImageStorage
}).single('storyImage');

app.use(
  session({
    // Key we want to keep secret which will encrypt all of our information
    secret: process.env.SESSION_SECRET,
    // Should we resave our session variables if nothing has changes which we dont
    resave: false,
    // Save empty value if there is no vaue which we do not want to do
    saveUninitialized: false
  })
);
// Funtion inside passport which initializes passport
app.use(passport.initialize());
// Store our variables to be persisted across the whole session. Works with app.use(Session) above
app.use(passport.session());

/*
app.get("/", (req, res) => {
  res.render("index");
});*/

/*
app.get("/users/register", checkAuthenticated, (req, res) => {
  res.render("register.ejs");
});

app.get("/users/login", checkAuthenticated, (req, res) => {
  // flash sets a messages variable. passport sets the error message
  console.log(req.session.flash.error);
  res.render("login.ejs");
});*/


app.get("/users/wrongLogin", checkAuthenticated, (req, res) => {
  console.log("user authenticaed pass = "+req.isAuthenticated());
  //res.json(res.body);
  res.send({message: "Wrong Loginn"});
});



app.get("/users/home", checkNotAuthenticated, (req, res) => {
  console.log("user authenticated pass = "+req.isAuthenticated());
 // res.render("dashboard", { user: req.user.name });
 //res.send({message: "In home page"});
 //res.json(req.user);

});

app.get("/users/logout", (req, res) => {
  req.logout();
  res.send({message: "You have succesfully logged out"});
});


/*

app.post("/users/register", async(req, res) => {

  //uploadUserImage(req,res, (err)=>{
   /* if(err){
      res.send({message: "Couldn't upload image"});
    }else{*/

     // const profile_pic_path="http://localhost:4000/posts/"+req.file.fieldname+"-"+req.file.originalname; 
/*     const profile_pic_path="some path"
     const role="USER"
      let { first_name, last_name, email, phone, password, password2} = req.body;

      let errors = [];

  console.log({
    first_name, 
    last_name, 
    email, 
    phone, 
    //profile_pic_path,
    password, 
    password2
  });

  if (!first_name || !last_name || !email|| !phone|| !profile_pic_path|| !password || !password2) {
    errors.push({ message: "Please enter all fields" });
  }

  if (password.length < 6) {
    errors.push({ message: "Password must be a least 6 characters long" });
  }

  if (password !== password2) {
    errors.push({ message: "Passwords do not match" });
  }

  if (errors.length > 0) {
      res.send({errors});
  } else {


    hashedPassword = await bcrypt.hash(password, 10);
    console.log(hashedPassword);

    // Validation passed

    
        ///////

        pool.query(`SELECT * FROM users
        WHERE email = $1`,
      [email], (err, results) => {
        if (err) {
          console.log(err);
        }

        console.log(results.rows);

        if (results.rows.length > 0) {
          return res.send({
            message: "Email already registered"
          });
          }
          else{


            pool.query(
              `INSERT INTO users (first_name, last_name, email, phone, profile_pic_path, role, password)
                  VALUES ($1, $2, $3, $4, $5, $6, $7)
                  RETURNING user_id, password`,
              [first_name, last_name, email, phone, profile_pic_path,role,hashedPassword],
              (err, results) => {
                if (err) {
                  throw err;
                }
                console.log(results.rows);
                res.send({
                  message: "Succesfully registerd"
                }
                );
                //res.redirect("/users/login");

              }
            )
////////////////////////

          }


      }


        )


  }



      

    //} //here


 // } //upload function
  
  
 // )//upload function


});
/*
app.post("/users/register", (req, res) => {



  uploadUserImage(req,res, (err)=>{

    if(err){
      res.send({message: "Couldn't upload image"});
    }else{

  const profile_pic_path="http://localhost:4000/posts/"+req.file.fieldname+"-"+req.file.originalname; 
  let { first_name, last_name, email, phone, password, password2 } = req.body;
 

  let errors = [];

  console.log({
    first_name, 
    last_name, 
    email, 
    phone, 
    //profile_pic_path,
    password, 
    password2
  });

  if (!fist_name || !last_name || !email|| !phone|| !profile_pic_path|| !password || !password2) {
    errors.push({ message: "Please enter all fields" });
  }

  if (password.length < 6) {
    errors.push({ message: "Password must be a least 6 characters long" });
  }

  if (password !== password2) {
    errors.push({ message: "Passwords do not match" });
  }

  if (errors.length > 0) {
      res.send({errors});
  } else {

    hashedPassword =  bcrypt.hash(password, 10);
    console.log(hashedPassword);

    hashedPassword =  bcrypt.hash(password, 10);
    console.log(hashedPassword);
    // Validation passed
    pool.query(
      `SELECT * FROM users
        WHERE email = $1`,
      [email],
      (err, results) => {
        if (err) {
          console.log(err);
        }
        console.log(results.rows);

        if (results.rows.length > 0) {
          return res.send({
            message: "Email already registered"
          });
        } else {
          pool.query(
            `INSERT INTO users (first_name, last_name, email, phone, profile_pic_path, password)
                VALUES ($1, $2, $3, $4, $5, $6)
                RETURNING id, password`,
            [first_name, last_name, email, phone, profile_pic_path, hashedPassword],
            (err, results) => {
              if (err) {
                throw err;
              }
              console.log(results.rows);
              res.send({
                message: "Succesfully registerd"
              }
              );
              //res.redirect("/users/login");
            }
          
          );
        }
      
      }
  
    );
  
  }

}
  
});*/



app.post("/users/register", (req, res,) => {
   
  uploadUserImage(req,res, async (err)=>{
  
      if(err){
          res.send({msg:err});
      }else{
         
          
          
          
          const role="USER"
          let { first_name, last_name, email, phone, password, password2 } = req.body;

          const profile_pic_path="http://localhost:4000/user_images/"+req.file.fieldname+"-"+req.file.originalname; 

          let errors = [];

          if (!first_name || !last_name || !email|| !phone|| !profile_pic_path|| !password || !password2) {
            errors.push({ message: "Please enter all fields" });
          }
        
          if (password.length < 6) {
            errors.push({ message: "Password must be a least 6 characters long" });
          }
        
          if (password !== password2) {
            errors.push({ message: "Passwords do not match" });
          }
        
          if (errors.length > 0) {
              res.send({errors});
          } else {

            hashedPassword = await bcrypt.hash(password, 10);
            console.log(hashedPassword);
         // Validation passed

    
        ///////
/*
const personname= "someone"
const userid= 9
        pool.query(`INSERT INTO user_posts (person_name,user_id)
        VALUES ($1,$2)
        RETURNING post_id`,
    [personname, userid]);*/

        pool.query(`SELECT * FROM users
        WHERE email = $1`,
      [email], (err, results) => {
        if (err) {
          console.log(err);
        }

        console.log(results.rows);

        if (results.rows.length > 0) {
          return res.send({
            message: "Email already registered"
          });
          }
          else{


            pool.query(
              `INSERT INTO users (first_name, last_name, email, phone, profile_pic_path, role, password)
                  VALUES ($1, $2, $3, $4, $5, $6, $7)
                  RETURNING user_id, first_name, last_name, email, phone, profile_pic_path, password`,
              [first_name, last_name, email, phone, profile_pic_path,role,hashedPassword],
              (err, results) => {
                if (err) {
                  throw err;
                }
                console.log(results.rows[0].user_id);
                //res.send({id:results.rows[0].user_id})
                res.json(results.rows)


                
               // res.send(email)
                //res.redirect("/users/login");

              }
            )

            



/*
            pool.query(`SELECT * FROM users WHERE email = $1`, [email], (err, results) => {
              if (err) {
                return done(err);
              }
              console.log(`ID is ${results.rows[0].id}`);
              
            });
*/
////////////////////////

          }


      }


        )
            


            



          }

         /*
          console.log(first_name,last_name)
          console.log(profile_pic_path)*/
          

         // res.json({message:"New post added"});

      }
  
  });
      
    });
//////////////////////////////////////////////////

    app.get("/users/posts", async(req,res)=>{
      try{
          //app.use(express.static('images'+'./uploads/'));
         //http://localhost:4000/posts/postImage-bigbird_image.png    //because you've set static as
          const allPosts= await pool.query("SELECT * FROM user_posts");
          res.json(allPosts.rows);
          console.log(allPosts);
    
      }catch(err){
    console.error(err.message)
      }
    })

    app.get("/users/posts/:id", async(req,res)=>{
      const {id}= req.params
    
      try{
        const post= await pool.query("SELECT * FROM user_posts WHERE user_id = $1",[id]);
      
        res.json(post.rows[0]);
    
        //res.json(recepie.rows);
            }catch(err){
        console.error(err.message)
            }
    });

    



app.post("/users/post", (req, res,) => {
   
uploadPostImage(req,res, (err)=>{

    if(err){
        res.send({message:"Error fetching image"});
    }else{
       
        const {person_name}=req.body;
        const {person_age}=req.body;
        const {person_height}=req.body;
        const {last_seen}=req.body;
        const {reward}=req.body;
        const {user_id}=req.body;
        const post_image_path="http://localhost:4000/posts/"+req.file.fieldname+"-"+req.file.originalname; 
        console.log(post_image_path)
        //const post_image_path=file.fieldname+'-'+Date.now()+path.extname(req.file.originalname); 
        const newPost=pool.query("INSERT INTO user_posts(person_name, person_age, person_height, last_seen, reward, user_id, post_image_path) VALUES ($1,$2,$3,$4,$5,$6,$7) RETURNING *", [person_name, person_age, person_height, last_seen, reward, user_id, post_image_path]);
        //console.log(req.file,req.body);
        res.json({message:"New post added"});
    }

});
    
  });

/*

  app.put('/users/post/:id', (req, res) => {
    

    uploadPostImage(req,res, (err)=>{

        if(err){
            res.render('index', {
    msg:err
            });
        }else{


    const {id}=req.params;
    const post_image_path=req.file.fieldname+"-"+req.file.originalname; 
    let updatePost = 'UPDATE user_posts SET person_name=$1, person_age=$2, person_height=$3, last_seen=$4, reward=$5, post_image_path=$6 WHERE post_id=$7'
    pool.query(updatePost, [req.body.person_name, req.body.person_age, req.body.person_height, req.body.last_seen, req.body.reward, post_image_path , req.params.id], (err, data) => {
      if (err)
      { 
        console.log(err);
      }
      res.json({message:"Post was updated"})
    })
    console.log(post_image_path)

}

});
})

*/

app.delete("/users/post/:id", async(req,res)=>{
  
  
  try{

const {id}=req.params;

const deletePost= await pool.query("DELETE FROM user_posts WHERE post_id = $1",[id])
res.json({message:"Post was succesfully deleted"});
 

        }catch(err){
    console.error(err.message)
        }


});


app.put('/users/post/:id', (req, res) => {
    

  uploadPostImage(req,res, (err)=>{

      if(err){
          res.render('index', {
  msg:err
          });
      }else{


  const {id}=req.params;
  const post_image_path=req.file.fieldname+"-"+req.file.originalname; 
  let updatePost = 'UPDATE user_posts SET person_name=$1, person_age=$2, person_height=$3, last_seen=$4, reward=$5, post_image_path=$6 WHERE post_id=$7'
  pool.query(updatePost, [req.body.person_name, req.body.person_age, req.body.person_height, req.body.last_seen, req.body.reward, post_image_path , req.params.id], (err, data) => {
    if (err) console.log(err);
    res.json({message:"Post was updated"})
  })
  console.log(post_image_path)

}

});
})


 ///////////////////////////
 
 
 app.get("/users/stories", async(req,res)=>{
  try{
      
      const allStories= await pool.query("SELECT * FROM user_stories");
      res.json(allStories.rows);
      console.log(allStories);

  }catch(err){
console.error(err.message)
  }
})

app.get("/users/stories/:id", async(req,res)=>{
  const {id}= req.params

  try{
    const story= await pool.query("SELECT * FROM user_stories WHERE story_id = $1",[id]);
  
    res.json(story.rows[0]);

    //res.json(recepie.rows);
        }catch(err){
    console.error(err.message)
        }
});


app.post("/users/stories", (req, res,) => {
   
  uploadStoryImage(req,res, (err)=>{
  
      if(err){
        console.log(err)
          res.send({message:"Error fetching image"});
      }else{
         
          const {story}=req.body;
          const {user_id}=req.body;
          const story_picture_path="http://localhost:4000/posts/"+req.file.fieldname+"-"+req.file.originalname; 
          console.log(story_picture_path)
          //const post_image_path=file.fieldname+'-'+Date.now()+path.extname(req.file.originalname); 
          const newStories=pool.query("INSERT INTO user_stories(story, story_picture_path, user_id) VALUES ($1,$2,$3) RETURNING *", [story, story_picture_path, user_id]);
          //console.log(req.file,req.body);
          res.json({message:"New story added"});
      }
  
  });
      
    });


    app.delete("/users/stories/:id", async(req,res)=>{
  
  
      try{
    
    const {id}=req.params;
    
    const deletePost= await pool.query("DELETE FROM user_stories WHERE story_id = $1",[id])
    res.json({message:"Story was succesfully deleted"});
     
    
            }catch(err){
        console.error(err.message)
            }
    
    
    });
    
    
    app.put('/users/story/:id', (req, res) => {
        
    
      uploadStoryImage(req,res, (err)=>{
    
          if(err){
              
          }else{
    
    
      const {id}=req.params;
      const story_image_path=req.file.fieldname+"-"+req.file.originalname; 
      let updateStory= 'UPDATE user_stories SET story=$1, story_picture_path=$2 WHERE story_id=$3'
      pool.query(updatePost, [req.body.story, req.body.story_picture_path, req.params.id], (err, data) => {
        if (err) console.log(err);
        res.json({message:"Post was updated"})
      })
      console.log(post_image_path)
    
    }
    
    });
    })




app.post(
  "/users/login",
  passport.authenticate("local", {
    successRedirect: "/users/home",
    failureRedirect: "/users/wrongLogin"
  })
);

function checkAuthenticated(req, res, next) {
  if (req.isAuthenticated()) {
    return res.redirect("/users/home");
  }
  next();
}

function checkNotAuthenticated(req, res, next) {
  if (req.isAuthenticated()) {
    return next();
  }
  res.redirect("/users/wrongLogin");
}

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}\n`);
});



/*
INSERT INTO user_posts (person_name, person_age, person_height, last_seen, reward, user_id,post_image_path)
                  VALUES ($1, $2, $3, $4, $5, $6, $7)
                  RETURNING user_id, password`,
              ("huhj", "huhj", "huhj", "huhj", "huhj","huhj");



              INSERT INTO user_posts (person_name, person_age, person_height, last_seen, reward, user_id,post_image_path)
VALUES("huhj", "huhj", "huhj", "huhj", "huhj","huhj") RETURNING user_id, password;


INSERT INTO user_posts (person_name)
VALUES("jjjjjk");*/