FROM nodered/node-red-docker

USER root

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
RUN echo "deb http://repo.mongodb.org/apt/debian jessie/mongodb-org/3.4 main" | tee /etc/apt/sources.list.d/mongodb-org-3.4.list
RUN apt-get update

RUN apt-get install -y mongodb-org
RUN apt-get install -y supervisor
RUN npm install node-red-node-mongodb

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD flows_ORD02273.json /usr/src/node-red/flows.json

ADD employee.json employee.json
ADD role.json role.json
ADD endorsement.json endorsement.json
ADD like.json like.json
ADD category.json category.json

ADD insert.sh insert.sh

EXPOSE 27017 1880

# Create the MongoDB data directory
RUN mkdir -p /data/db

ENTRYPOINT ["/usr/bin/supervisord"]
