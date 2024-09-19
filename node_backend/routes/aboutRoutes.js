const express = require('express');

const aboutController = require('./../controllers/aboutController');

const aboutRouter = express.Router();

aboutRouter
  .route('/')
  .get(aboutController.getAllAbout)
  .post(aboutController.AddAbout);

module.exports = aboutRouter;
