FROM node:9-alpine
MAINTAINER "Mickael Magniez <mickaelmagniez@gmail.com>"

ENV NODE_ENV production

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ADD package.json /usr/src/app/

RUN npm install && \
    npm prune && \
    npm cache clean \
    rm -rf /tmp/*

ADD . /usr/src/app/

EXPOSE 80 25

CMD ["bin/maildev", "--web", "80", "--smtp", "25"]
