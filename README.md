docker-meteor
=============
This is a Dockerfile for building a containerized Meteor application image. It is expected that you have MongoDB deployed elsewhere. This Dockerfile builds on top of [chriswessels/docker-base](http://github.com/chriswessels/docker-base).

1. Use [Demeteorizer](https://github.com/onmodulus/demeteorizer) to bundle your Meteor.js application. Run `demeteorizer . --tarball bundle.tar.gz` in your Meteor project.
2. Place the resulting `bundle.tar.gz` file in this repo.
3. Update the environment variables in the `meteor.sv.conf` file with your MONGO_URL and ROOT_URL information.
4. Run `docker build -t meteor-deployment .`

##License

Please see the `LICENSE` file for more information.
