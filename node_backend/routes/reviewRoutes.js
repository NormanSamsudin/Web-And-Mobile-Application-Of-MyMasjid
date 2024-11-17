const express = require('express');

const reviewController = require('./../controllers/reviewController');

const reviewRouter = express.Router();

reviewRouter
  .route('/')
  .get(reviewController.getAllReview)
  .get(reviewController.getReviewById)
  .post(reviewController.AddReview);

module.exports = reviewRouter;
