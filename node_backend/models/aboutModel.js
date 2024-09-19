const mongoose = require('mongoose');

// seat schema
const aboutSchema = mongoose.Schema({
  mosqueId: {
    type: String,
    required: true
  },
  fullName: {
    type: String,
    required: true
  },
  position: {
    type: String,
    min: 1,
    max: 5,
    required: true
  },
  contact: {
    type: String,
    default: Date.now
  },
  imageUrl: {
    type: String,
    required: false
  }
});

const About = mongoose.model('About', aboutSchema);

module.exports = About;
