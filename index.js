import express from "express";

// Creating an app with express
const app = express();

// Defining a Port for the app 
const PORT = 3500;

// GET routes 
app.get("/products", (req, res) => {
  res.json({ message: "This is the GET product path" });
});

app.get("/users", (req, res) => {
  res.json({ message: "This is the GET user path" });
});


// POST routes
app.post("/products", (req, res) => {
  res.json({ message: "This is the post path and a product was added" });
});
app.post("/users", (req, res) => {
  res.json({ message: "This is the post path and a user was added" });
});

// Patch routes
app.patch("/users", (req, res) => {
  res.json({ message: "This is the patch path and a user was edited/updated" });
});
app.patch("/products", (req, res) => {
  res.json({
    message: "This is the patch path and a products was edited/updated",
  });
});

// PUT routes 
app.put("/users", (req, res) => {
  res.json({ message: "This is the put path and a user was replacted " });
});

app.put("/products", (req, res) => {
  res.json({
    message: "This is the put path and a products was replaced"
  });
})


// Delete routes
app.delete("/users", (req, res) => {
  res.json({ message: "This is the delete path and a users was deleted" });
});
app.delete("/products", (req, res) => {
  res.json({ message: "This is the delete path and a products was deleted" });
});


// Connecting to the port
app.listen(PORT, () => {
  console.log("http://localhost/:" + PORT);
});
