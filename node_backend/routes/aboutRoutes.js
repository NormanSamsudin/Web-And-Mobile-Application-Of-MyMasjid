const express = require('express');

const aboutController = require('./../controllers/aboutController');

const aboutRouter = express.Router();

aboutRouter
  .route('/')
  .get(aboutController.getAllAbout)
  .get(aboutController.getAboutById)
  .post(aboutController.AddAbout);

module.exports = aboutRouter;
