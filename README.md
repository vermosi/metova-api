# metova-api

This is an api built by Kyle Ashmore for consideration for a Rails Developer position at the company Metova.



Breakdown of how the application works:
  - Authenticate using Name and Email via JSON at `:3000/authenticate` via `POST` method.
  - Take the generated authentication token and add it to your header via: 
     - `Authorization: Bearer <insert authentication token here>.`
  - Gain access to the rest of the API.

Resources used to make this application:
  - [rails-api](https://github.com/rails-api/rails-api)
  - [rspec-rails](https://github.com/rspec/rspec-rails)
  - [jwt](https://github.com/jwt/ruby-jwt)
  - [Advanced REST Client](https://chrome.google.com/webstore/detail/advanced-rest-client/hgmloofddffdnphfgcellkdfbfbjeloo)
  - [Sublime Text 2](http://www.sublimetext.com/2)
  - Lots of coffee.

### What I learned with this project:
---
- How API endpoints are accomplished in Rails using rails-api instead of the full library.
- Added token based authentication with the potential of variable algorithms for hightened security.
- How serializers worked in producing customized JSON objects.
- How to work with SQLite3 databases with Rails applications.
  


