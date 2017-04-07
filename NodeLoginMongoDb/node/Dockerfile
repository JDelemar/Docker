FROM node:6.10.1-alpine
#FROM node:6.10.0-alpine
# ARG sitedir
# ARG sitevar
#ARG siteport

# #RUN apk add --update bash \
# #    && rm -rf /var/cache/apk/* \
# RUN  mkdir /app \
#      && echo COPY ./$sitedir /app
#     #  && echo COPY $sitevar /app/$sitevar

# COPY ./sites/$sitedir /app
# # COPY $sitevar /app/$sitevar

# Need for bcrypt
# RUN apk add --update python make g++

WORKDIR /app


# make more versitile
# ADD ./sites/$sitedir/package.json /app 
ADD ./sites/site/package.json /app 
RUN npm install

# ADD ./sites/$sitedir/. /app 
ADD ./sites/site/. /app 
# this variable is visible inside the container
ENV NODE_ENV=development

#EXPOSE $siteport # works with/without this
#CMD ["node", "/app/$sitevar"]
#CMD node /app/$sitevar
#CMD ["sh", "-c" "node /app/$sitevar"]
#CMD ["sh", "-c" "echo /app/$sitevar"]
# ENV sitevar=${sitevar}
# CMD node /app/$sitevar
# CMD node /app/server.js

#CMD ["node_modules/.bin/nodemon", "server.js"]
CMD node /app/app.js 