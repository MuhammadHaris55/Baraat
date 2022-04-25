const Hallsdb = require("../Model/hallsDetails");

// Create Halls

exports.createHalls = (req, res) => {
  if (!req.body) {
    res.status(400).send({ data: "Please Complete All Information" });
    return;
  }
  const halls = new Hallsdb({
    images: req.body.images,
    OwnerName: req.body.OwnerName,
    hallName: req.body.hallName,
    OwnerContact: req.body.OwnerContact,
    OwnerEmail: req.body.OwnerEmail,
    HallAddress: req.body.HallAddress,
    HallCapacity: req.body.HallCapacity,
    PricePerHead: req.body.PricePerHead,
    CateringPerHead: req.body.CateringPerHead,
    EventPlanner: req.body.EventPlanner,
    areaId: req.body.areaId,
    hallOwnerId: req.body.hallOwnerId,
  });
  halls
    .save(halls)
    .then((data) => {
      res.status(200).send({ data: data });
    })
    .catch((err) => {
      res.status(400).send({ data: err });
    });
};

// Get halls accourding to Area_ID

exports.getHalls = (req, res) => {
  Hallsdb.find({ areaId: req.params.areaId })
    .then((data) => {
      res.status(200).send({ data: data });
    })
    .catch((err) => {
      res.status(400).send({ error: err });
    });
};

// Get All Halls Data

exports.getAllHalls = (req, res) => {
  Hallsdb.find()
    .then((data) => {
      res.status(200).send({ data: data });
    })
    .catch((err) => {
      res.status(400).send({ error: err });
    });
};
