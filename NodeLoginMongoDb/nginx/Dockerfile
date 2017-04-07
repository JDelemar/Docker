FROM nginx:1.11.12-alpine
#FROM nginx:1.11.10-alpine

RUN apk add --update bash \
        nano \
        htop \
    && mkdir -p /etc/ssl/private
# Or just 
# RUN mkdir -p /etc/ssl/private

# copy custom configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# copy certificates
COPY ./certificates /etc/ssl/private

# copy startup script
COPY start.sh /root/start.sh

RUN chmod +x /root/start.sh 

CMD /root/start.sh
