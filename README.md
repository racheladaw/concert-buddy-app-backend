# Concert Buddy API

The Concert Buddy API supplies data about upcoming concerts in your area.

This app utilizes a Rails API back-end with a PostgreSQL database. It is meant to be used alongside the Concert Buddy React application found [here](https://github.com/racheladaw/concert-buddy-frontend).

### Getting Started

To get started using this app do the following:

- Clone the repository
  - ```git clone https://github.com/racheladaw/concert-buddy-app-backend.git```
- Navigate to the top of the concert buddy backend directory
  - ```cd concert-buddy-app-backend```
- Install required gem dependencies
  - ```bundle install```
- Start a PostgreSQL server in the PostgreSQL app
  - Download the app at 'https://www.postgresql.org/download/' if you don't have it
- Create the database
  - ```rake db:create```
- Migrate the tables
  - ```rake db:migrate```
- Start your rails server
  - ```rails s```
- Now start the React server following the README on the link above.

- Enjoy the app!

[Video Demo](https://www.youtube.com/watch?v=vqVIXRB8UxU)

[Blog Post](https://dev.to/racheladaw/react-redux-project-3mch)

##### If you have any feedback for my application, don't hesitate to let me know. Thank you for checking it out!
