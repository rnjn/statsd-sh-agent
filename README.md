Simple shell agent to send system usage information to statsd over udp, as %ages

Usage
1. Set ```STATSD_HOST``` to your statsd server URI (defaults to localhost)
2. Set ```STATSD_PORT``` to the port your server is listening on (defaults to 8125)
3. Set the right prefix for the gauge name, right now its ```hostname```
4. run ``` ./monitor.sh ``` to recieve system information 

TODO
* add I/O stats to the script
