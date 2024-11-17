const express = require('express');

const lostController = require('./../controllers/lostController');

const lostRouter = express.Router();

lostRouter
  .route('/')
  .get(lostController.getAllLostItem)
  .get(lostController.getLostItembyId)
  .post(lostController.AddLostItem);

module.exports = lostRouter;
