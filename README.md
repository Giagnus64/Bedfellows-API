# Bedfellows
A webapp that connects users and allows them to manage their relationships with each other.  

## Features
Users are able request relationships with other users, as well as accept or deny relationship requests. Once in a relationship, users can schedule dates with their relationship partners.  Users can also edit their profile information. 

## Screenshots
Live Here:[BedFellows](https://bedfellows-client.herokuapp.com/home) Demo Video coming soon!

## Built with
 *Back-end*
- [Ruby on Rails](https://rubyonrails.org) - Server Framework
- [PostgreSQL](https://www.postgresql.org) - Database
- Auth using [JWT](https://jwt.io) tokens and [bcrypt ] (https://rubygems.org/gems/bcrypt/versions/3.1.12) encryption

*Front-end*
- [React](https://reactjs.org/docs/getting-started.html) - Front-end Framework
- [React Redux](https://react-redux.js.org) 
- [Semantic UI](https://react.semantic-ui.com/) - CSS framework with [Sass] formatted custom CSS(https://sass-lang.com)
- [semantic-ui-calendar-react](https://www.npmjs.com/package/semantic-ui-calendar-react) - 



## Installation
*Requirements*
 - [Node.js](https://nodejs.org/en/)
 - [Installing Ruby](https://www.ruby-lang.org/en/documentation/installation/)
 - [PostgreSQL](https://www.postgresql.org)


In your clone/fork of this repo: 
```ruby
bundle install
rails db:create #creates database
rails db:migrate #creates tables in db
rails db:seed #creates seed data
rails s #to run the server
```
The instructions for the front-end of this app are [here](https://github.com/Giagnus64/Bedfellows-Front-End). You'll need to clone/fork both repos. 



## License
[MIT](https://choosealicense.com/licenses/mit/)