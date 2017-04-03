FROM node:6.10.0-alpine
ARG sitedir

WORKDIR /app

# make more versitile
ADD ./sites/$sitedir/package.json /app 
RUN npm install
ADD ./sites/$sitedir/. /app 
# this variable is visible inside the container
ENV NODE_ENV=development

CMD ["node_modules/.bin/nodemon", "server.js"]