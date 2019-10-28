# dns-to-dns-over-tls

DNS to DNS over TLS proxy


This implements a DNS resolver. It listens on port 53 and resolve requests with an upsteam DNS server over TLS.


How to implement:

* Used maproxy library for handling proxy operations.
* It is a tcp+tls forwarder.


Setup instructions:

*Start the container using the below command
docker run -itd -p 5353:53 raghu-dns 


*Check for the logs
docker logs <container id>

*Should get some output like this 
tcp://127.0.0.1:53 -> tcp+tls://1.1.1.1:853

*Do a dig to verify
dig @localhost -p 5353 +tcp python.org

Security Concerns and Improvements:

* When an organisation is handling sensitive data like financial and medical records, we will need a way to ensure that even the DNS resolution which is integral to service discovery is secured and resistant and tampering. A DNS stub proxy allows existing services to work without any major changes.

* Reduce latency by having long persistent connections with the upstream server.

* Implemeting of proper TLS/SSL certificates and ensure that the upstream server is not compromised

* I have hardcoded the upstream server IP which can be made a varibale to change different servers.

* Handle UDP connections.
