$composeCommand = "docker-compose"
$composeArgs = @()
$composeArgs += "up";
$composeArgs += "--force-recreate"
$composeArgs += "--build"
$composeArgs += "-d"

Invoke-Expression -Command "$composeCommand $composeArgs"

$nodes = @(
    "http://mytoxiproxy:7071",
    "http://mytoxiproxy:7072",
    "http://mytoxiproxy:7073"
);

function AddNodeToCluster() {
    param($FirstNodeUrl, $OtherNodeUrl, $AssignedCores = 1)

    $otherNodeUrlEncoded = $OtherNodeUrl
    $uri = "$($FirstNodeUrl)/admin/cluster/node?url=$($otherNodeUrlEncoded)&assignedCores=$AssignedCores"
    $curlCmd = "curl -L -X PUT '$uri' -d ''"
    docker exec -it raven1 bash -c "$curlCmd"
    Write-Host
    Start-Sleep -Seconds 10
}


Start-Sleep -Seconds 20

$firstNodeIp = $nodes[0]

foreach ($node in $nodes | Select-Object -Skip 1) {
    write-Host "Add node $node to cluster";
    AddNodeToCluster -FirstNodeUrl $firstNodeIp -OtherNodeUrl $node
}

write-host "Reassign cores max of 3"
$uri = "$($firstNodeIp)/admin/license/set-limit?nodeTag=A&maxUtilizedCores=3"
$curlCmd = "curl -L -X POST '$uri' -H 'Content-Type: application/json; charset=utf-8' -H 'Content-Length: 0'"
docker exec -it raven1 bash -c "$curlCmd"