const express = require("express")
const app = express()
const path = require("path")
const hbs = require("hbs")
const collections = require("./app")
const collection = collections.LogInCollection;
const collection1 = collections.EventsCollection;
const answersCollection = collections.AnswersCollection;
const questionsCollection = collections.QuestionsCollection;
const informationCollection = collections.InformationCollection;
const templatePath = path.join(__dirname, "/templates")

app.use(express.json())
app.use(express.urlencoded({ extended: true }))

app.set("view engine", "hbs")
app.set("views", templatePath)




app.listen(5000, () => {
  console.log("port connected")
})

app.get("/", (req, res) => {
  res.render("Login")
})



app.get("/signup", (req, res) => {
  res.render("signup")
})

app.post("/signup", async (req, res) => {
  const newUser = {
    name: req.body.name,
    password: req.body.password,
    role: req.body.role
  }

  await collection.insertMany([newUser])

  res.json(newUser)

})

app.delete("/deleteUser", async (req, res) => {
  const userToDelete = {
    name: req.body.name,
    password: req.body.password,
    role: req.body.role
  }

  await collection.deleteOne(userToDelete);

  res.send("User deleted");
})

app.get('/login', async(req,res) => {
  const users = await collection.find({});
  res.json(users);

})


app.post('/login', async (req, res) => {
    const check = await collection.findOne({ name: req.body.name });
    console.log(check);
    try {
      if (check.password === req.body.password) {
        res.json(check);
      } else {
        res.status(404).send('Wrong password or name.');
      }
    } catch (err) {
      console.log(err);
      res.status(500).send('Something went wrong.');
    }
  });



app.post("/signup", async (req, res) => {
  const newUser = {
    name: req.body.name,
    password: req.body.password,
    role: req.body.role
  }

  await collection.insertMany([newUser])

  res.render("login")

})

app.get("/event", async (req, res) => {
  const data = await collection1.find({});
  res.json(data);
});

app.put("/event/:id", async (req, res) => {
   
  let id= req.params.id*1;
  let EventT0update = Eventdata.find(p=>p.id===id);
  let index = Evenntdata.indexOf(EventT0update);

  Eventdata[index] = req.body;

  res.status(200).send({
    " message ":"updated"
  })
});


app.delete("/event", async (req, res) => {
  const { id } = req.body;

  const eventToDelete = {
    name: req.body.name,
    description: req.body.description,
    date: req.body.date,
    time: req.body.time
  }

  // id or full body?
  await collection1.deleteOne(eventToDelete);

  res.send("Event deleted");
})

app.post("/event/addEvent", async (req, res) => {
  try {
    const newEvent = {
      description: req.body.description,
      date: req.body.date,
      time: req.body.time
    }

    await collection1.insertMany([newEvent])
    res.status(201).json(newEvent)

  }
  catch {
    res.send("Unable to create event. Try again. ")
  }

})

app.get("/info", async (req, res) => {
  const data = await informationCollection.find({});
  res.json(data);
});

app.post("/info", async (req, res) => {
  const newInfo = {
    title: req.body.title,
    symptom: req.body.symptom,
  }

  await informationCollection.insertMany([newInfo])
  res.json(newInfo);
})

app.get("/question", async (req, res) => {
  const data = await questionsCollection.find({});
  res.render("home", { data: data });
});

app.post("/question", async (req, res) => {
  const newQuestion = {
    name: req.body.name,
    question: req.body.question,
  }

  await questionsCollection.insertMany([newQuestion])
  res.render("home")
})

app.get("/answer", async (req, res) => {
  const data = await answersCollection.find({});
  res.render("home", { data: data });
});

app.post("/answer", async (req, res) => {
  const newAnswer = {
    name: req.body.name,
    answer: req.body.answer
  }

  await answersCollection.insertMany([newAnswer])
  res.render("home")
})


