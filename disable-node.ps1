$uri = "http://mytoxiproxy:8474/proxies/raven1tcp"
$disable = '{"name" : "raven1tcp", "listen" : "mytoxiproxy:6061", "upstream" : "raven1:38888", "enabled": false}'
$disable = $disable.replace('"', '\"')
$curlCmd = "curl -L -X POST '$uri' -d '$disable'"

docker exec -it raven1 bash -c "$curlCmd"
