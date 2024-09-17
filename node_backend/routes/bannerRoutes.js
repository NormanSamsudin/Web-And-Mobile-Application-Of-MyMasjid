const express = require('express');

const bannerController = require('./../controllers/bannerController');

const bannerRouter = express.Router();

bannerRouter
  .route('/')
  .get(bannerController.getAllBanner)
  .post(bannerController.AddBanner);

module.exports = bannerRouter;
