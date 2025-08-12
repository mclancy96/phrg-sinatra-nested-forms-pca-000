# Rails Nested Forms Lab: Pirates!

## Overview

In this lab, you'll practice using nested forms in Rails.

## Instructions

This lab uses ActiveRecord and a database to persist pirate and ship data.

1. Create two ActiveRecord models, a `Pirate` class and a `Ship` class. Pirates should have a name, weight, and height. Ships should have name, type, and booty attributes. Set up the proper associations between pirates and ships (a pirate has many ships, and ships belong to a pirate).
2. Make a nested form using Rails form helpers (this should probably have html `<label>`s so it makes sense to a user). This form will be creating three objects (one instance of the Pirate class, and two instances of the Ship class) and persisting them to the database. Remember, you'll need to build a corresponding controller action to load this page. Your form should `POST` to the route `'/pirates'`.
3. After a user clicks submit they should be taken to a page that displays all the information we just posted from the form. You should have a page that shows the pirate you created along with their ships and all the details about the pirate and their ships.

## Setup

1. Run `bundle install` to install the required gems
2. Run `rails db:migrate` to create the database tables
3. Set up your routes in `config/routes.rb`
4. Implement the controller actions in `app/controllers/pirates_controller.rb`
5. Complete the model classes in `app/models/` with proper associations
6. Create the view templates in `app/views/pirates/`
7. Start your Rails server with `rails server`

## Rails-Specific Implementation

### Database Setup

Run the migrations to create the pirates and ships tables:

```bash
rails db:migrate
```

### Models

Set up ActiveRecord models with proper associations:

- `Pirate` model should have `has_many :ships` and `accepts_nested_attributes_for :ships`
- `Ship` model should have `belongs_to :pirate`

### Routes

You'll need to define routes in `config/routes.rb` for:

- Root route that displays the welcome message
- GET route for `/new` to show the form
- POST route for `/pirates` to handle form submission
- GET route to show pirate details after submission

### Controller

Implement the `PiratesController` with the following actions:

- `index` - displays welcome message
- `new` - renders the form (don't forget to build ships for the form)
- `create` - processes form submission and saves to database
- `show` - displays pirate and ship information from database

Use strong parameters to permit the nested attributes for pirate and ships.

### Views

Create view templates using Rails conventions:

- `app/views/pirates/index.html.erb` - welcome page
- `app/views/pirates/new.html.erb` - form page with nested fields using `fields_for`
- `app/views/pirates/show.html.erb` - results page showing saved data

Use Rails form helpers like `form_with`, `fields_for` for nested forms.

## Deliverables

Pass the tests! You'll notice in specs that we use Capybara to fill in certain fields. It looks something like this:

```
fill_in("ship_name_1", :with => "Flying Dutchman")
fill_in("ship_type_1", :with => "ghost ship")
fill_in("ship_booty_1", :with => "gold coins")
```

The word in quotes after fill_in needs to be set as an ID in the form. This is because your ship name one and two will have the same `name` property. Capybara needs some sort of unique identifier, so we use `id`. So something like this:

```erb
<%= text_field_tag "pirate[ships][][name]", "", id: "ship_name_1" %>
```

## Resources

- [Rails Guides - Form Helpers](https://guides.rubyonrails.org/form_helpers.html)
- [Rails Guides - Nested Forms](https://guides.rubyonrails.org/form_helpers.html#nested-forms)
- [Rails Guides - Strong Parameters](https://guides.rubyonrails.org/action_controller_overview.html#strong-parameters)
