const express = require('express');
const cors = require('cors');
const mongoose = require('mongoose');
const morgan = require('morgan');
const body_parser = require('body-parser');
const path = require('path');
const routes = require('./Server/Routes/routes');
const connectDB = require('./Server/Database/connection');

const app = express();
const port = process.env.PORT || 5000;

app.use(cors());
app.use(express.json());
app.use(morgan('tiny'));
app.use(body_parser.urlencoded({ extended: true }));
connectDB();

app.use('/', routes);
app.listen(port, () => {
  console.log(`Server is running on port : ${port}`);
});
