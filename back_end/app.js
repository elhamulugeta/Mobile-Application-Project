const mongoose = require("mongoose");

mongoose.connect("mongodb://0.0.0.0:27017/Users")
.then(() =>{
    console.log("Database Connected");
})
.catch((err) =>{
    throw err;
})
const LogInSchema = new mongoose.Schema({
    name:
        {type: String}
    ,
    password:
    {type: String},
    role:
    {type: String}

})

const EventsSchema = new mongoose.Schema({
    eventsTitle:
        {type: String}
    ,
    description:{
        type: String
    },
    date:{
        type: String
    },
    time:{
        type: String
    }
})

const QuestionsSchema = new mongoose.Schema({
    name:{
        type: String
    }, 
    question:{
        type: String
    }
})

const AnswersSchema = new mongoose.Schema({
    name:{
        type: String
    },
    answer:{
        type: String
    }
})

const InformationSchema = new mongoose.Schema({
    title:{
        type: String
    },
    
    symptom:{
        type: String
    }
})



const LogInCollection = new mongoose.model("LogInCollection", LogInSchema)
const EventsCollection = new mongoose.model("EventCollection", EventsSchema)
const QuestionsCollection = new mongoose.model("QuestionsCollection", QuestionsSchema)
const AnswersCollection = new mongoose.model("AnswersCollection", AnswersSchema)
const InformationCollection = new mongoose.model("InformationCollection", InformationSchema) 
module.exports = {LogInCollection, EventsCollection, QuestionsCollection, AnswersCollection, InformationCollection}