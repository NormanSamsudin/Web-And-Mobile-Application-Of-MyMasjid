const mongoose = require('mongoose');

// seat schema
const lostSchema = mongoose.Schema({
  mosqueId: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User',
    required: true
  },
  status: {
    type: String,
    required: true
  },
  imageUrl: {
    type: String,
    required: true
  }
});

const Lost = mongoose.model('Lost', lostSchema);

module.exports = Lost;
