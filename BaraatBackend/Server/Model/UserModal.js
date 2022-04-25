const mongoose = require('mongoose');

const schema = mongoose.Schema;

const userSchema = new schema(
  {
    UserName: {
      type: String,
      required: true,
      unique: true,
    },
    FullName: {
      type: String,
      required: true,
    },
    UserEmail: {
      type: String,
      required: true,
    },
    phoneNumber: {
      type: String,
      required: true,
    },
    password: {
      type: String,
      required: true,
      minlength: 6,
    },
    userRoll: {
      type: Number,
      required: true,
    },
  },
  {
    timestamps: true,
  }
);

const userdb = mongoose.model('userdb', userSchema);
module.exports = userdb;
