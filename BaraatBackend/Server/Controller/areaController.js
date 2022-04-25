const Areadb = require('../Model/area');

// ADD Areas

exports.addAreas = (req, res) => {
  if (!req.body) {
    res.status(400).send({ data: 'Please Complete All Information' });
    return;
  }
  const area = new Areadb({
    areaImage: req.body.areaImage,
    areaName: req.body.areaName,
    hallsId: req.body.hallsId,
  });
  area
    .save(area)
    .then((data) => {
      res.status(200).send({ data: data });
    })
    .catch((err) => {
      res.status(400).send({ data: err });
    });
};

// get All Areas

exports.getAreas = (req, res) => {
  Areadb.find()
    .then((data) => {
      res.status(200).send({ data: data });
    })
    .catch((err) => {
      res.status(400).send({ data: err });
    });
};
