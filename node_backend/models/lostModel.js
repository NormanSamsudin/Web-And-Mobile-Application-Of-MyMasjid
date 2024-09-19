const mongoose = require('mongoose');

// seat schema
const lostSchema = mongoose.Schema({
  mosqueId: {
    type: String,
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
