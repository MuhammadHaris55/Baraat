const hallBookDetailsdb = require("../Model/hallsBooking");

// Book Hall

exports.bookHall = (req, res) => {
  if (!req.body) {
    res.status(400).send({ data: "Please Complete All Information" });
    return;
  }
  const hallBooking = new hallBookDetailsdb({
    Date: req.body.Date,
    Time: req.body.Time,
    GuestsQuantity: req.body.GuestsQuantity,
    EventPlaner: req.body.EventPlaner,
    CateringServices: req.body.CateringServices,
    TotalPaynment: req.body.TotalPaynment,
    userId: req.body.userId,
    hallOwnerId: req.body.hallOwnerId,
  });
  hallBooking
    .save(hallBooking)
    .then((data) => {
      res.status(200).send({ data: data });
    })
    .catch((err) => {
      res.status(400).send({ data: err });
    });
};

//  Get booking details

exports.getOrderDetails = (req, res) => {
  hallBookDetailsdb
    .find({ userId: req.params.userId })
    .then((data) => {
      res.status(200).send({ data: data });
    })
    .catch((err) => {
      res.status(400).send({ error: err });
    });
};

// Get Booked Halls

exports.getBookedHalls = (req, res) => {
  hallBookDetailsdb
    .find({ hallOwnerId: req.params.hallOwnerId })
    .then((data) => {
      res.status(200).send({ data: data });
    })
    .catch((err) => {
      res.status(400).send({ error: err });
    });
};
