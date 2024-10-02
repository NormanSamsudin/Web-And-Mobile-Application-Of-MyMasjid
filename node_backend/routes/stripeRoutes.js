const express = require('express');

const stripeController = require('./../controllers/stripeController');

const stripeRouter = express.Router();

// route to sign up user
stripeRouter.post('/paymentIntent', stripeController.paymentIntent);

module.exports = stripeRouter;
