//const rateLimit = require('express-rate-limit'); //bruteforce protection
const Stripe = require('stripe');
const catchAsync = require('./../utils/catchAsync');

const stripe = Stripe(process.env.STRIPE_SECRET_KEY);

exports.paymentIntent = catchAsync(async (req, res, next) => {
  const { amount, currency } = req.body; // You may also include other parameters like user details

  // Create a PaymentIntent with the specified amount and currency
  const paymentIntent = await stripe.paymentIntents.create({
    amount: amount, // Amount should be in the smallest currency unit (e.g., cents for USD)
    currency: currency
  });

  // Send the client secret to the frontend
  res.status(200).send({
    clientSecret: paymentIntent.client_secret
  });
});
