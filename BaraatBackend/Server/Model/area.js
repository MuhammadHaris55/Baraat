const mongoose = require("mongoose");

const schema = mongoose.Schema;

const areaSchema = new schema(
  {
    areaImage: {
      type: String,
      // required: true,
    },
    areaName: {
      type: String,
      required: true,
    },
    hallsId: {
      type: Array,
    },
  },
  {
    timestamps: true,
  }
);

const areaSchemadb = mongoose.model("areaSchemadb", areaSchema);
module.exports = areaSchemadb;
