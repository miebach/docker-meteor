#             https://github.com/chriswessels/docker-base
FROM          chriswessels/base

MAINTAINER    Chris Wessels <undefined.za@gmail.com>

#             Add Node.js ppa to apt and update system
RUN           add-apt-repository ppa:chris-lea/node.js && \
              apt-get update && apt-get -y upgrade

#             Install Node, Phantom (for supporting the crawlable package)
RUN           apt-get install -y nodejs phantomjs

#             Add the custom bundle.tar.gz (Meteor app) to the container
RUN           mkdir -p /meteor
ADD           bundle.tar.gz /meteor/bundle.tar.gz

#             Extract Meteor deployment and install requisite npm modules (necessary for binary modules)
RUN           cd /meteor && tar zxvf bundle.tar.gz && \
              npm install

#             Add supervisord config for Meteor app
ADD           meteor.sv.conf /etc/supervisor/conf.d/meteor.sv.conf

EXPOSE        80
