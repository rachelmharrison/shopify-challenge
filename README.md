# README

This is Rachel Harrison's solution to Shopify's Summer 2019 Backend Developer Intern Challenge Question.

It is implemented in Ruby on Rails with a GraphQL API. 

To see the docs, run the server, go to [http://localhost:3000/graphiql](http://localhost:3000/graphiql) and click "Docs"

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

## Development Process

After deciding I would implement this project in Rails (which I was already familiar with), I decided I would also use GraphQL. Before starting this challenge I had only worked with RESTful APIs, so learning the basics of GraphQL allowed me to broaden my skill set. 

After setting up the repository and basic project structure, I added the `Product` model to the schema. I then added the following queries and mutations:
- allProducts: returns either all products or all products with stock based on optional `in_stock` boolean parameter (default is false and returns all products)
- oneProduct: takes a mandatory `title` parameter and returns the matching product if it exists
- createProduct: takes 3 mandatory parameters (`title`, `price`, `inventory_count`) and retursn the newly created product if all 3 parameters pass validation defined in the model
- purchaseProduct: takes a mandatory `title` parameter, decreases the stock by one (if possible) and returns the product. If the product doesn't exist or has no stock, returns an error

After writing each resolver, I wrote unit tests. I considered implemeting my tests using RSpec, but decided to use Minitest to keep it simple as it is a very small test suite. 
