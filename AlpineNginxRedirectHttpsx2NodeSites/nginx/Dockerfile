FROM nginx:1.13.8-alpine

RUN apk add --update bash \
        nano \
        htop \
        curl \
    && rm -rf /var/cache/apk/* \        
    && mkdir -p /etc/ssl/private
# bash, nano, and htop do not have to be included
    # nano for editing insided of container instead of vi
    # htop for looking at processes inside of container
    # curl check for data from http/https servers

# copy custom configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# copy certificates
COPY ./certificates /etc/ssl/private

# copy startup script
COPY start.sh /root/start.sh

RUN chmod +x /root/start.sh 

CMD /root/start.sh