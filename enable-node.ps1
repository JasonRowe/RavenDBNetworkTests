$uri = "http://mytoxiproxy:8474/proxies/raven1tcp"
$enable = '{"name" : "raven1tcp", "listen" : "mytoxiproxy:6061", "upstream" : "raven1:38888", "enabled": true}'
$enable = $enable.replace('"', '\"')
$curlCmd = "curl -L -X POST '$uri' -d '$enable'"

docker exec -it raven1 bash -c "$curlCmd"
