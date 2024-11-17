const express = require('express');

const activityController = require('./../controllers/activityController');

const activityRouter = express.Router();

activityRouter
  .route('/')
  .get(activityController.getAllActivity)
  .get(activityController.getActivityById)
  .post(activityController.AddActivity);

module.exports = activityRouter;
