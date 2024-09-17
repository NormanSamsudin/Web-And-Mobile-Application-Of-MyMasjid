//const rateLimit = require('express-rate-limit'); //bruteforce protection

const Banner = require('../models/bannerModel');
const factory = require('./handlerFactory');

exports.getAllBanner = factory.getAll(Banner);
exports.AddBanner = factory.createOne(Banner);
