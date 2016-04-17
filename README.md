# skinny_controllers demo

The commands used to create this project
```
rails new skinny_controllers_demo --api
cd skinny_controllers_demo
rails g scaffold basic_model name:string description:string
bin/rails db:migrate RAILS_ENV=test
rake test # passing default tests

```
