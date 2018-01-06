#!/bin/sh
# ip=$(getent hosts testnode1 | awk '{ print $1 }')
# echo $ip
# sed "s/localhost:8000/$ip:8000/g" /etc/nginx/nginx.conf > /root/new.conf
# nginx

# echo Site 1 port $PORT1
# echo Site 2 port $PORT2
# echo

ip=$(getent hosts $HOST1 | awk '{ print $1 }')
echo IP for $HOST1 is $ip
sed "s,proxy_pass http://$HOST1,proxy_pass http://$ip:$PORT1,g" /etc/nginx/nginx.conf > /root/beforenode.conf

# wait for $HOST1 container to be ready
# ping TCP port of remote host using netcat
# nc -zvv $HOST1 $PORT1 # -zuvv for UDP
echo "Waiting for $HOST1"
while true; do
    nc -z -w1 $HOST1 $PORT1 2>/dev/null && break
done
echo "Waiting for $HOST2"
while true; do
    nc -z -w1 $HOST2 $PORT2 2>/dev/null && break
done

ip1=$(getent hosts $HOST1 | awk '{ print $1 }')
ip2=$(getent hosts $HOST2 | awk '{ print $1 }')
sed "s/localhost:$PORT1/$ip1:$PORT1/g;s/localhost:$PORT2/$ip2:$PORT2/g" /etc/nginx/nginx.conf > /root/afternode.conf
sed "s,proxy_pass http://$HOST1,proxy_pass http://$ip1:$PORT1,g;s,proxy_pass http://$HOST2,proxy_pass http://$ip2:$PORT2,g" /etc/nginx/nginx.conf > /root/afternode.conf
mv /etc/nginx/nginx.conf /root/nginx.conf.old
mv /root/afternode.conf /etc/nginx/nginx.conf 
# sed "s/localhost:8000/$ip1:8000/g" /etc/nginx/nginx.conf > /root/afternode.conf
# sed "s/localhost:8000/$ip2:8001/g" /etc/nginx/afternode.conf > /root/afternode2.conf

echo "Starting nginx"
nginx

# sleeps a number of seconds...for some reason docker exits without monitoring the nginx service
echo "Sleeping"
while true; do sleep 1000; done # about 16 minutes