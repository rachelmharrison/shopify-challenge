# README

This is Rachel Harrison's solution to Shopify's Summer 2019 Backend Developer Intern Challenge Question.

It is implemented in Ruby on Rails with a GraphQL API. 

To view the full API documentation please go here: 

To view the reasoning and development process behing this project please go here:

## Ruby Version

This project uses ruby version 2.5.3.
If necessary, you can download [here.](https://www.ruby-lang.org/en/downloads/)

## Set up

To install dependencies:

<code>gem install bundler</code>

<code> gem install rails</code>

To clone this repo: 

<code>git clone git@github.com:rachelmharrison/shopify-challenge.git</code>

Finally:

<code>cd shopify-challenge</code>  

<code>bundle install</code>

## Running the Application

To create and reset the database:

<code>rails db:setup</code>

<code>rails db:reset</code>

To start the server:

<code>rails server</code>

There is no front end for this project.
To view the GraphiQL interface, naviagte to [http://localhost:3000/graphiql](http://localhost:3000/graphiql).


## Testing 

To run the unit test suite:

<code>rails test</code>

To test the functionallity of the API, start the server and naviagte to [http://localhost:3000/graphiql](http://localhost:3000/graphiql).
