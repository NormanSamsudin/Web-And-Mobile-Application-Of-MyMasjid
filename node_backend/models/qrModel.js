const mongoose = require('mongoose');

// seat schema
const qrSchema = mongoose.Schema({
  user: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User',
    required: true
  },
  url: {
    type: String,
    required: true
  }
});

const Qr = mongoose.model('Qr', qrSchema);

module.exports = Qr;
