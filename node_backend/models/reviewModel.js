const mongoose = require('mongoose');

// seat schema
const reviewSchema = mongoose.Schema({
  userId: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User',
    required: true
  },
  mosqueId: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User',
    required: true
  },
  message: {
    type: String,
    required: true
  },
  rating: {
    type: Number,
    min: 1,
    max: 5,
    required: true
  },
  createdAt: {
    type: Date,
    default: Date.now
  },
  imageUrl: {
    type: String,
    required: false
  }
});

const Review = mongoose.model('Review', reviewSchema);

module.exports = Review;
