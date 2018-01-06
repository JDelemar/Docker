FROM node:8.9.4-alpine
ARG sitedir

WORKDIR /app

# make more versitile
ADD ./sites/$sitedir/package.json /app 
# install openssl
RUN apk add --update openssl && \
    rm -rf /var/cache/apk/*
# RUN npm install
RUN yarn
ADD ./sites/$sitedir/. /app 
# this variable is visible inside the container
ENV NODE_ENV=development

CMD ["node_modules/.bin/nodemon", "server.js"]