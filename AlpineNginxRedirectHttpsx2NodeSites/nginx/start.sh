#!/bin/sh
# ip=$(getent hosts testnode1 | awk '{ print $1 }')
# echo $ip
# sed "s/localhost:8000/$ip:8000/g" /etc/nginx/nginx.conf > /root/new.conf
# nginx

# echo Site 1 port $PORT1
# echo Site 2 port $PORT2
# echo

ip=$(getent hosts testnode1 | awk '{ print $1 }')
echo IP for testnode1 is $ip
sed "s/localhost:$PORT1/$ip:$PORT1/g" /etc/nginx/nginx.conf > /root/beforenode.conf

# wait for testnode1 container to be ready
echo "Waiting for testnode1"
while true; do
    nc -z -w1 testnode1 8000 2>/dev/null && break
done
echo "Waiting for testnode2"
while true; do
    nc -z -w1 testnode2 8001 2>/dev/null && break
done

ip1=$(getent hosts testnode1 | awk '{ print $1 }')
ip2=$(getent hosts testnode2 | awk '{ print $1 }')
sed "s/localhost:$PORT1/$ip1:$PORT1/g;s/localhost:$PORT2/$ip2:$PORT2/g" /etc/nginx/nginx.conf > /root/afternode.conf
mv /etc/nginx/nginx.conf /root/nginx.conf.old
mv /root/afternode.conf /etc/nginx/nginx.conf 
# sed "s/localhost:8000/$ip1:8000/g" /etc/nginx/nginx.conf > /root/afternode.conf
# sed "s/localhost:8000/$ip2:8001/g" /etc/nginx/afternode.conf > /root/afternode2.conf

echo "Starting nginx"
nginx

# sleeps a number of seconds...for some reason docker exits without monitoring the nginx service
echo "Sleeping"
while true; do sleep 1000; done # about 16 minutes