# vagranttest
A simple test of load balancing using vagrant

This Vagrantfile will start three instances, all based on the latest CentOS 7 box from VirtualBox.
There are two web servers: apache1 and apache2
There is a load balancer: haproxy

The web servers display a simple 'Hello World!' message.
The load balancer shares the requests between the two web servers.

Assumptions:
- You have a working Vagrant environment
- You have access to the latest centos/7 box from VirtualBox.
- Subnet 192.168.1.x is available for use.
  If your subnet is different you'll need to change 'Vagrantfile' and 'data/haproxy.cfg'.

Testing:
To test the installation perform the following steps:

1. Clone this repository to your local environment.
2. Tweak the environment, if required (see my assumptions above).
3. Run 'vagrant up'.
4. Open a browser and navigate to 'http://192.168.1.103/'.
   You should see 'Hello World!'.
5. Refresh the screen at least 3 times at 5 second intervals.
   You should still see 'Hello World!'.
6. Connect to the load balancer using SSH.
   vagrant ssh haproxy
7. Switch to the root account and navigate to the logs directory.
   sudo su
   cd /var/log
8. Display the haproxy log file
   cat haproxy.log
   You will see that the request is switching between apache1 and apache2.

Sample output:

[root@haproxy log]# cat haproxy.log 
Jul 10 22:47:35 haproxy haproxy[31015]: Proxy http_frontend started.
Jul 10 22:47:35 haproxy haproxy[31015]: Proxy web_server started.
Jul 10 22:49:53 haproxy haproxy[31016]: 192.168.1.1:52574 [10/Jul/2018:22:49:48.033] http_frontend web_server/apache1 1/1/5004 385 cD 0/0/0/0/0 0/0
Jul 10 22:50:11 haproxy haproxy[31016]: 192.168.1.1:52578 [10/Jul/2018:22:49:54.822] http_frontend web_server/apache2 1/1/16365 919 cD 0/0/0/0/0 0/0
Jul 10 22:50:27 haproxy haproxy[31016]: 192.168.1.1:52580 [10/Jul/2018:22:50:22.188] http_frontend web_server/apache1 1/0/5004 385 cD 0/0/0/0/0 0/0
Jul 10 23:03:47 haproxy haproxy[31016]: 192.168.1.1:52625 [10/Jul/2018:23:03:42.552] http_frontend web_server/apache2 1/1/5005 385 cD 0/0/0/0/0 0/0

Tested using Vagrant 2.1.2 on Mac OS X High Sierra 10.13.5


