# skinny_controllers demo

This is a walkthrough on setting up a brand new project and demonstrating
how skinny_controllers are used

## Initial Setup

The commands used to create this project
```
rails new skinny_controllers_demo --api
cd skinny_controllers_demo
rails g scaffold basic_model name:string description:string
bin/rails db:migrate RAILS_ENV=test
rake test # passing default tests
```

## Authentication

That will get a basic app going. But we still need user authentication before we
can use skinny_controllers. Though, for the purposes of this demo, instead of
implementing authentication, we'll just stub current_user on the application
controller.  Everyone's Authentication needs are different, and it's just easier
to omit for now.

Generate a user resource
```
rails g scaffold user user_name:string first_name:string, last_name:string
```

Add a relationship to the user:
```ruby
class User < ApplicationRecord
  has_many :basic_models
end
```
Generate a migration for the foreign key and migrate
```
rails g migration add_user_id_to_basic_model user_id:int
bin/rails db:migrate RAILS_ENV=test
```

Modify the application controller:
```ruby
class ApplicationController < ActionController::API
  def current_user
    User.first
  end
end
```



Add to the gemfile:
```ruby
gem 'skinny_controllers'
```

then run `bundle` in the terminal.

Following the [devise](https://github.com/plataformatec/devise#getting-started) wiki,
```
rails generate devise:install
rails generate devise User
```
