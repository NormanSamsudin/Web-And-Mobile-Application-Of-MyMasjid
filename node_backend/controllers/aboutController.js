//const rateLimit = require('express-rate-limit'); //bruteforce protection

const multer = require('multer');
const sharp = require('sharp');
const catchAsync = require('./../utils/catchAsync');
const factory = require('./handlerFactory');
const AppError = require('./../utils/AppError');
const About = require('../models/aboutModel');

const multerStorage = multer.memoryStorage();

const multerFilter = (req, file, cb) => {
  if (file.mimetype.startsWith('image')) {
    cb(null, true);
  } else {
    cb(new AppError('Not an image! Please upload an image.', 400), false);
  }
};

const upload = multer({ storage: multerStorage, fileFilter: multerFilter });

exports.resizeQrPhoto = catchAsync(async (req, res, next) => {
  // if no file exist in req
  if (!req.file) return next();

  req.file.filename = `${req.user.id}-${Date.now()}.png`;

  await sharp(req.file.buffer)
    .resize(500, 500)
    .toFormat('png')
    .jpeg({ quality: 90 })
    .toFile(`public/img/review/${req.file.filename}`);

  next();
});

exports.uploadAboutPhoto = upload.single('photo');
exports.getAllAbout = factory.getAll(About);
exports.AddAbout = factory.createOne(About);
