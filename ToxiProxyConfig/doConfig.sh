echo starting
curl -f -sS -XPOST -d '{"name" : "raven1", "listen" : "mytoxiproxy:7071", "upstream" : "raven1:8080"}' http://mytoxiproxy:8474/proxies
curl -f -sS -XPOST -d '{"name" : "raven2", "listen" : "mytoxiproxy:7072", "upstream" : "raven2:8080"}' http://mytoxiproxy:8474/proxies
curl -f -sS -XPOST -d '{"name" : "raven3", "listen" : "mytoxiproxy:7073", "upstream" : "raven3:8080"}' http://mytoxiproxy:8474/proxies
curl -f -sS -XPOST -d '{"name" : "raven1tcp", "listen" : "mytoxiproxy:6061", "upstream" : "raven1:38888"}' http://mytoxiproxy:8474/proxies
curl -f -sS -XPOST -d '{"name" : "raven2tcp", "listen" : "mytoxiproxy:6062", "upstream" : "raven2:38888"}' http://mytoxiproxy:8474/proxies
curl -f -sS -XPOST -d '{"name" : "raven3tcp", "listen" : "mytoxiproxy:6063", "upstream" : "raven3:38888"}' http://mytoxiproxy:8474/proxies
echo done