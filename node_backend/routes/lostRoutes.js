const express = require('express');

const lostController = require('./../controllers/lostController');

const lostRouter = express.Router();

lostRouter
  .route('/')
  .get(lostController.getAllLostItem)
  .post(lostController.AddLostItem);

module.exports = lostRouter;
