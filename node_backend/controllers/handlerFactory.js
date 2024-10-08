const catchAsync = require('./../utils/catchAsync');
const AppError = require('./../utils/AppError');
const APIFeature = require('./../utils/apifeatures');

exports.deleteOne = Model =>
  catchAsync(async (req, res, next) => {
    const doc = await Model.findByIdAndDelete(req.params.id);

    if (!doc) {
      return next(new AppError('No doc found with that ID', 404));
    }

    res.status(204).json({
      status: 'success',
      data: null
    });
  });

exports.updateOne = Model =>
  catchAsync(async (req, res, next) => {
    const doc = await Model.findByIdAndUpdate(req.params.id, req.body, {
      new: true,
      runValidators: true
    });

    //implement 404 not found error
    if (!doc) {
      // kalau error nnti die akan trigger dekat middleware
      return next(new AppError('No document found with that ID', 404));
    }

    res.status(200).json({
      status: 'success',
      data: {
        data: doc
      }
    });
  });

//handler routes
exports.createOne = Model =>
  catchAsync(async (req, res, next) => {
    const doc = await Model.create(req.body);
    res.status(201).json({
      status: 'success',
      data: {
        data: doc
      }
    });
  });

exports.getOne = (Model, popOptions) =>
  catchAsync(async (req, res, next) => {
    let query = Model.findById(req.params.id);

    if (popOptions) query = query.populate(popOptions);
    const doc = await query;

    //implement 404 not found error
    if (!doc) {
      // kalau error nnti die akan trigger dekat middleware
      return next(new AppError('No doc found with that ID', 404));
    }

    res.status(200).json({
      status: 'OK',
      result: doc.length,
      data: doc
    });
  });

exports.getAll = Model =>
  catchAsync(async (req, res, next) => {
    // allow nested routes GET reviews on tour (hack)
    let filter = {};
    if (req.params.tourId) filter = { tour: req.params.tourId };
    //Build Query
    const features = new APIFeature(Model.find(filter), req.query)
      .filter()
      .sort()
      .limitFields()
      .paginate();

    // Execute Query
    //const doc = await features.query.explain();
    const doc = await features.query;

    //Send Response
    res.status(200).json({
      status: 'OK',
      result: doc.length,
      data: doc
    });
  });
