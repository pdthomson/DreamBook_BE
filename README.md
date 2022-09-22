## Welcome to the Back-end repo for DreamBook!

[DreamBook](https://github.com/pdthomson/DreamBook_BE) Back-end API was built alongside the [DreamBook](https://github.com/pdthomson/DreamBook_FE) Front-end application! The back-end is responsible for receiving requests from the front-end, storing data, and packaging up the data and returning it to the front-end for viewing.

## Table of contents

- Schema
- Setup
- Gems
- Endpoints
- Environments
- Developers

## Schema: 

![Screen Shot 2022-09-22 at 1 12 18 PM](https://user-images.githubusercontent.com/90064385/191810476-7ded9548-90ea-40f3-9bcd-3ccdb3979a92.png)

## Setup

- `Ruby 2.7.4`
- `Rails 5.2.8.1'`
- [Fork this repository](https://github.com/pdthomson/DreamBook_BE)
- Clone your fork
- From the command line, install gems and set up your DB:
- `bundle install`
- `rails db:create`
- `rails db:migrate`
- Install Figaro with `bundle exec figaro install` to create an `application.yml` file locally (this to be updated with any needed ENV variables!!!)

## Gems

-   [RSpec](https://github.com/rspec/rspec-rails)
-   [ShouldaMatchers](https://github.com/thoughtbot/shoulda-matchers)
-   [Capybara](https://github.com/teamcapybara/capybara)
-   [SimpleCov](https://github.com/simplecov-ruby/simplecov)

## Endpoints

###Get all blogs
get '/api/v1/blogs'

![Screen Shot 2022-09-22 at 1 33 24 PM](https://user-images.githubusercontent.com/90064385/191813809-2575599a-d345-4f7d-94e1-b0d625cd856a.png)

###Get a blog
get "/api/v1/blogs/:blog_id"

![Screen Shot 2022-09-22 at 1 38 59 PM](https://user-images.githubusercontent.com/90064385/191814879-7caf7dd0-e2ab-4e43-bd1c-012e8fce0bb7.png)

###Get All comments for a blog
get "/api/v1/blogs/:blog_id/comments"

![Screen Shot 2022-09-22 at 1 41 58 PM](https://user-images.githubusercontent.com/90064385/191815428-64d7de1c-7d04-445b-8dd2-9d58886f0cb0.png)

##Create a blog
post "/api/v1/blogs"

