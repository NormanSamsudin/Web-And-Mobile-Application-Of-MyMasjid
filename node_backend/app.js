const express = require('express');
const swaggerUi = require('swagger-ui-express');
const morgan = require('morgan');
const helmet = require('helmet');
const mongoSanitize = require('express-mongo-sanitize');
const xxs = require('xss-clean');
//const hpp = require('hpp');
const AppError = require('./utils/AppError');
const globalErrorHandler = require('./controllers/errorController');
const userRouter = require('./routes/userRoutes');
const bannerRouter = require('./routes/bannerRoutes');
const reviewRouter = require('./routes/reviewRoutes');
const secureHeaders = require('./config/secureHeader');
const limiter = require('./config/limiter');
const swaggerSpesification = require('./config/swaggerOption');
const activityRouter = require('./routes/activityRoutes');
const lostRouter = require('./routes/lostRoutes');
const aboutRouter = require('./routes/aboutRoutes');
const stripeRouter = require('./routes/stripeRoutes');

const app = express();

// securityhttp headers
app.use(helmet());

// logging client requests
console.log(process.env.NODE_ENV);
if (process.env.NODE_ENV === 'development') {
  app.use(morgan('dev')); //morgan ni guna untuk jadikan die akan print setiap request yang kita buat
}

app.use('/api', limiter);

// data sanitization against NoSQL query injection
app.use(mongoSanitize());

// data sanitization agains XXS injection
app.use(xxs());

// prevent parameter pollution
// app.use(
//   hpp({
//     whitelist: [
//       'duration',
//       'ratingsAverage',
//       'ratingsQuantity',
//       'maxGroupSize',
//       'difficulty',
//       'price'
//     ]
//   })
// );

app.use(secureHeaders);

app.use(express.json({ limit: '10kb' }));

app.use('/public', express.static('public'));

app.use(
  '/api-docs',
  swaggerUi.serve,
  swaggerUi.setup(swaggerSpesification, {
    explorer: true,
    customCssUrl:
      'https://cdn.jsdelivr.net/npm/swagger-ui-themes@3.0.0/themes/3.x/theme-newspaper.css'
  })
);

app.use('/api/v1/users', userRouter);
app.use('/api/v1/banners', bannerRouter);
app.use('/api/v1/reviews', reviewRouter);
app.use('/api/v1/activities', activityRouter);
app.use('/api/v1/lost', lostRouter);
app.use('/api/v1/about', aboutRouter);
app.use('/api/v1/stripe', stripeRouter);

app.all('*', (req, res, next) => {
  next(new AppError(`Can't find ${req.originalUrl} on this server!`, 404));
});

//global error handling middleware
app.use(globalErrorHandler);

// 4) START SERVER
module.exports = app;
