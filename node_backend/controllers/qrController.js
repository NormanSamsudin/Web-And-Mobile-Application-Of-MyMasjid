//const rateLimit = require('express-rate-limit'); //bruteforce protection

const multer = require('multer');
const sharp = require('sharp');
const catchAsync = require('./../utils/catchAsync');
const Qr = require('../models/qrModel');
const factory = require('./handlerFactory');
const AppError = require('./../utils/AppError');

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

  req.file.filename = `user-${req.user.id}-${Date.now()}.jpeg`;

  await sharp(req.file.buffer)
    .resize(500, 500)
    .toFormat('jpeg')
    .jpeg({ quality: 90 })
    .toFile(`public/img/qr/${req.file.filename}`);

  next();
});

exports.uploadUserPhoto = upload.single('photo');
exports.getAllQr = factory.getAll(Qr);
exports.getQrById = factory.getOne(Qr);
exports.AddQr = factory.createOne(Qr);
