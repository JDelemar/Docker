#!/bin/sh
# wait for loginweb container to be ready
echo "Waiting for loginweb"
while true; do
    nc -z -w1 loginweb $WEBPORT 2>/dev/null && break
done
echo "Waiting for loginmongo"
while true; do
    nc -z -w1 loginmongo $MONGOPORT 2>/dev/null && break
done

ip1=$(getent hosts loginweb | awk '{ print $1 }')

sed "s/localhost:$WEBPORT/$ip1:$WEBPORT/g" /etc/nginx/nginx.conf > /root/afternode.conf

mv /etc/nginx/nginx.conf /root/nginx.conf.old
mv /root/afternode.conf /etc/nginx/nginx.conf 

echo "Starting nginx"
nginx

# sleeps a number of seconds...for some reason docker exits without monitoring the nginx service
echo "Sleeping"
while true; do sleep 1000; done # about 16 minutes