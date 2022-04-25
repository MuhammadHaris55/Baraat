const mongoose = require("mongoose");

require("dotenv").config();
const uri = process.env.ATLAS_URI;

// const connection = mongoose.connect(uri);
// mongoose.connect(uri, { useNewUrlParser: true });
const connect = async () => {
  try {
    mongoose.connect(uri, { useNewUrlParser: true });

    const connection = mongoose.connection;

    connection.once("open", () => {
      console.log("Connected");
    });
  } catch (error) {
    console.log(error);
    process.exit(1);
  }
};

module.exports = connect;
