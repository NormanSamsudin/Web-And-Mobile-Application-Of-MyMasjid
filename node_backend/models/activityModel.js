const mongoose = require('mongoose');

// seat schema
const activitySchema = mongoose.Schema({
  mosqueId: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User',
    required: true
  },
  programName: {
    type: String,
    required: true
  },
  speaker: {
    type: String,
    required: true
  },
  imageUrl: {
    type: String,
    required: true
  },
  createdAt: {
    type: Date,
    required: true
  }
});

const Activity = mongoose.model('Activity', activitySchema);

module.exports = Activity;
