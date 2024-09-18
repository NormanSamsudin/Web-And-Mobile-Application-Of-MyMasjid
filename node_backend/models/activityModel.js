const mongoose = require('mongoose');

// seat schema
const activitySchema = mongoose.Schema({
  user: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User',
    required: true
  },
  name: {
    type: String,
    required: true
  },
  location: {
    type: String,
    required: true
  },
  speaker: {
    type: String,
    required: true
  },
  date: {
    type: Date,
    required: true
  }
});

const Activity = mongoose.model('Activity', activitySchema);

module.exports = Activity;
