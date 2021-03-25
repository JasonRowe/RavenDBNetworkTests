$uri = "http://mytoxiproxy:8474/proxies/raven1tcp/toxics"
$toxic = @{ type = "timeout"; attributes = @{timeout = 2000}} | ConvertTo-Json
$toxic = $toxic.replace('"', '\"')
$curlCmd = "curl -L -X POST '$uri' -d '$toxic'"
docker exec -it raven1 bash -c "$curlCmd"