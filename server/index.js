const express = require("express")
const mongoose = require("mongoose")
const cors = require("cors")

const userRoute = require('./routes/user_route')

const PORT = process.env.PORT || 3001 

const app = express()

app.use(cors())
app.use(express.json())
app.use(userRoute)

const DB = 'mongodb://127.0.0.1:27017/crud_testing';
 
mongoose.connect(DB).then(() => {

    console.log('Successfully connected!');
}).catch((err) => {
    console.log(err); 
})
 
app.listen(PORT, '0.0.0.0', () => {
    console.log(`connected to PORT: ${PORT}`);
})