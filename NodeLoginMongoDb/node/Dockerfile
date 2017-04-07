FROM node:6.10.1-alpine

WORKDIR /app

# make more versitile
ADD ./sites/site/package.json /app 
RUN npm install

ADD ./sites/site/. /app 
# this variable is visible inside the container
ENV NODE_ENV=development

CMD node /app/app.js 