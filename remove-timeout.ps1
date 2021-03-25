$uri = "http://mytoxiproxy:8474/proxies/raven1tcp/toxics/timeout_downstream"
$curlCmd = "curl -L -X DELETE '$uri'"
docker exec -it raven1 bash -c "$curlCmd"