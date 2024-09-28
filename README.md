# Mosque Management Application

This project is designed to facilitate mosque management through both mobile and web applications. The mobile app caters to two types of users: **Public** and **Mosque Admin**, while the web application is utilized by **Religious Authorities** to monitor and manage mosques.

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

[![Mosque Management App Demo](https://img.youtube.com/vi/YOUR_VIDEO_ID/0.jpg)](https://www.youtube.com/watch?v=dQw4w9WgXcQ)

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
   '''