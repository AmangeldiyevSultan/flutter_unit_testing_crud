const express = require("express")
const User = require('../models/user')
const userRoute = express.Router()

//! User Get
userRoute.get('/api/getuser', async(req, res)=> {
    console.log('GETUSER');
    const user = await User.find();
    console.log(user);  
    res.status(200).json({user});  
});
 
//! User Delete
userRoute.delete('/api/deleteuser/:name', async(req, res)=> {
    console.log('DELETEUSER'); 
    const name = req.params.name;
    const user = await User.deleteOne({name});
    
    res.status(200).json({user});   
}); 

//! User Update
userRoute.put('/api/updateuser/', async(req, res)=> {
   console.log('UPDATEUSER'); 
    const name = req.query.name;
    const newname = req.query.newname;
      
    let user = await User.findOne({name}); 
    
    if(user){ 
    user.name = newname;  

    user = await user.save(); 
    }  else {
        console.log('That user not exist');
    }
    res.status(200).json({user});   
});

//! User Post
userRoute.post('/api/newuser', async (req, res)=> {
    console.log('POSTUSER'); 
    
    try{
        const {name, email} = req.body;
            user = new User({
                name, email
            });
            console.log(user); 
            
            user = await user.save();
          

            res.status(200).json({user}); 
    } catch (e) {
        res.status(500).json({error: e.message});
    }
});

module.exports = userRoute;