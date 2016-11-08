# Rollplay
![Build Status](https://codeship.com/projects/b8c82d30-6c97-0134-5074-2643ab6f7762/status?branch=master)
![Code Climate](https://codeclimate.com/github/shanajeanh/rollplay.png)
[![Coverage Status](https://coveralls.io/repos/github/shanajeanh/rollplay/badge.svg?branch=master)](https://coveralls.io/github/shanajeanh/rollplay?branch=master)

A character sheet app for Paizo Games' *Pathfinder*. Users can log in with Google and then create a character sheet. Once the basic sheet is added, they can edit the sheet to add skills or update stats. They can also add spells, feats, class abilities, and weapons, or edit and delete anything. You can only view a list of your own characters, but individual character sheets are viewable by anyone, so you can link them to game masters or friends if you so choose.

Try [Rollplay](https://rollplay.herokuapp.com/) on heroku.

## Getting Started

```
git clone https://github.com/shanajeanh/rollplay.git

bundle
rake db:create
rake db:migrate
rake db: seed
rails server
```

From there, click log in with google and start creating character sheets.

## Running the tests

The test suite uses RSpec, FactoryGirl, and Capybara. To run the tests, simply run the ```rake``` command.

## Built With

* [Foundation](http://foundation.zurb.com/) - For styling
* [OmniAuth Google](https://github.com/zquestz/omniauth-google-oauth2) - Log-in system
* [Simple Form](https://github.com/plataformatec/simple_form) - For forms

## Authors

* **Shana Hausman** - [shanajeanh](https://github.com/shanajeanh)

## Acknowledgments

* Thank you to the team at Launch Academy, both the instructors and the other students in my cohort. I could not have done it without their help!
