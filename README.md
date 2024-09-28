# Mosque Management Application

This project is designed to facilitate mosque management through both mobile and web applications. The mobile app caters to two types of users: **Public** and **Mosque Admin**, while the web application is utilized by **Religious Authorities** to monitor and manage mosques.

## Why This Project Was Built

I built this project just for fun and to explore real-world development while waiting for job opportunities before starting my career. I'm not entirely sure if this project will evolve into a real product, but I hope one day it can be used to make a meaningful impact on the ummah. If you find this project valuable or believe it can go further, feel free to DM me for collaboration!

## Features

### Mobile Application (Flutter)
- **Mosque Review**: Users can leave reviews and feedback for mosques.
- **Sadaqah (Charity)**: A platform for users to donate to mosques.
- **Mosque Background Organization**: Information about the mosque's administration and history.
- **Lost and Found**: Manage lost and found items within the mosque premises.
- **Contact**: Easy access to mosque contact information.
- **Money Tracking**: Allows users to track their donations and sadaqah history.
- **Volunteering**: Users can sign up for volunteering opportunities at mosques.

### Web Application (Node.js)
- **Monitor Mosques**: Religious authorities can monitor mosques, track activities, and generate reports.

## Technology Stack

- **Frontend**: Flutter (for both Android and iOS)
- **Backend**: Node.js (Express.js)
- **Database**: MongoDB

### NPM Packages Used

Below is a list of the main Node.js packages used in this project, along with their purpose:

- **@ngrok/ngrok**: Used to expose the development server to the internet for testing purposes.
- **bcrypt & bcryptjs**: Libraries for hashing passwords securely. `bcryptjs` is a JavaScript-only version of `bcrypt`, useful when native dependencies are hard to install.
- **cross-env**: Allows you to set environment variables across platforms (Windows/Linux/macOS).
- **dotenv**: Loads environment variables from a `.env` file, allowing for better configuration management.
- **express-mongo-sanitize**: Helps prevent MongoDB operator injection attacks.
- **express-rate-limit**: Limits the number of requests a user can make in a given time to protect against brute force attacks.
- **helmet**: Enhances the security of your Express apps by setting various HTTP headers.
- **hpp**: Protects against HTTP parameter pollution attacks.
- **html-to-text**: Converts HTML content to plain text, which is useful for sending plain text emails.
- **jsonwebtoken**: Used to create and verify JSON Web Tokens (JWTs) for user authentication.
- **mongoose**: ODM (Object Data Modeling) library to interact with MongoDB, making it easier to manage and validate schemas.
- **morgan**: HTTP request logger middleware, useful for logging incoming requests to your app.
- **multer**: Middleware for handling file uploads.
- **nodemailer**: Allows the app to send emails, e.g., for password resets or notifications.
- **sharp**: Used for image processing, such as resizing and formatting uploaded images.
- **slugify**: Converts strings into URL-friendly slugs (useful for creating human-readable URLs).
- **swagger-jsdoc & swagger-ui-express**: These libraries allow you to generate API documentation and display it through Swagger UI.
- **validator**: Provides string validation and sanitization.
- **xss-clean**: Helps protect against cross-site scripting (XSS) attacks.

## Demo

Check out the demo video of the project:

[![Mosque Management App Demo](https://img.youtube.com/vi/dQw4w9WgXcQ/0.jpg)](https://www.youtube.com/watch?v=dQw4w9WgXcQ)

_Click on the image above to watch the demo on YouTube._

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/mosque-management-app.git
   cd node_backend
   npm install
   npm start
   cd ..
   cd flutter_application
   flutter pub get
   cd ..
   cd web_flutter_application
   flutter pub get
   ```

## API Endpoints

Below is a list of the available API endpoints for the Mosque Management Application.

| HTTP Method | Endpoint                           | Description                                      | Parameters                        |
| ----------- | ---------------------------------- | ------------------------------------------------ | --------------------------------- |
| `POST`      | `/api/v1/auth/register`            | Register a new user (public or mosque admin).    | `name`, `email`, `password`       |
| `POST`      | `/api/v1/auth/login`               | Log in an existing user.                         | `email`, `password`               |
| `GET`       | `/api/v1/mosques`                  | Get a list of all mosques.                       | -                                 |
| `GET`       | `/api/v1/mosques/:id`              | Get details of a specific mosque by ID.          | `id` (in URL)                     |
| `POST`      | `/api/v1/mosques`                  | Add a new mosque (admin only).                   | `name`, `location`, `admin`       |
| `PUT`       | `/api/v1/mosques/:id`              | Update mosque information (admin only).          | `id` (in URL), `name`, `location` |
| `DELETE`    | `/api/v1/mosques/:id`              | Delete a mosque (admin only).                    | `id` (in URL)                     |
| `POST`      | `/api/v1/reviews`                  | Add a review for a mosque.                       | `mosqueId`, `rating`, `comment`   |
| `GET`       | `/api/v1/reviews/:mosqueId`        | Get all reviews for a specific mosque.           | `mosqueId` (in URL)               |
| `POST`      | `/api/v1/sadaqah`                  | Donate sadaqah to a mosque.                      | `mosqueId`, `amount`              |
| `GET`       | `/api/v1/sadaqah/:userId`          | Get donation history for a specific user.        | `userId` (in URL)                 |
| `POST`      | `/api/v1/lost-and-found`           | Report a lost or found item in a mosque.         | `mosqueId`, `itemDescription`     |
| `GET`       | `/api/v1/lost-and-found/:mosqueId` | Get all lost and found items for a mosque.       | `mosqueId` (in URL)               |
| `POST`      | `/api/v1/volunteering`             | Sign up for a volunteering opportunity.          | `mosqueId`, `userId`              |
| `GET`       | `/api/v1/volunteering/:mosqueId`   | Get all volunteering opportunities for a mosque. | `mosqueId` (in URL)               |

### Authentication
Some of the endpoints require authentication. Make sure to include a valid JWT token in the `Authorization` header for protected routes.

