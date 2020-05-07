# Collectr

Collectr is a Sinatra application built as a project for the Flatiron School. The application allows users to login and and manage a database of artworks (ostsensibly ones owned by them). A video demo is available at: https://vimeo.com/385857973 . A Heroku deployment is available at: https://collectr-app.herokuapp.com/

## Getting Started

To run the project locally, fork and clone the project:
`git@github.com:aohibbard/Collector.git` and change to the local directory. Ensure gem dependencies are installed with `bundle install`, and run `shotgun` to operate locally. Unless configured differently, the project will run at `localhost:9393`.

### Prerequisites

The project requires an internet connection. It is built with Ruby for Sinatra and runs on an sqlite database for development and uses PostgresQL for production. The Hyperclient gem is required to work with Artsy's API. 

## Built With

* Sinatra
* Ruby

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags). 

## Authors

* **Andrew Hibbard


## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgements
This project interacts with Artsy's API. Shout out to Artsy's development team. 