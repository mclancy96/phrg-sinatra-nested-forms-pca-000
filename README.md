# Rails Nested Forms Lab: Pirates!

## Overview

In this lab, you'll practice using nested forms in Rails.

## Instructions

This lab uses ActiveRecord and a database to persist pirate and ship data.

1. Create two ActiveRecord models, a `Pirate` class and a `Ship` class. Pirates should have a name, weight, and height. Ships should have name, type, and booty attributes. Set up the proper associations between pirates and ships (a pirate has many ships, and ships belong to a pirate).
2. Make a nested form using Rails form helpers. This form will be creating three objects (one instance of the Pirate class, and two instances of the Ship class) and persisting them to the database. Your form should `POST` to the route `'/pirates'`.
3. After a user clicks submit they should be taken to a page that displays all the information posted from the form.

## Setup

1. Run `bundle install` to install the required gems
2. Run `rails db:migrate` to create the database tables
3. Set up your routes in `config/routes.rb`
4. Implement the controller actions in `app/controllers/pirates_controller.rb`
5. Complete the model classes in `app/models/` with proper associations
6. Create the view templates in `app/views/pirates/`
7. Start your Rails server with `rails server`

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
