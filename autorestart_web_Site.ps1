$ErrorActionPreference = "silentlyContinue"
$authInfo = (curl -Uri http://lsls.pre.nsc50.com -UseBasicParsing | findstr "StatusCode")
if($authInfo)
{
    "Nginx ok"
}
else
{
    "Nginx no ok"
    ssh root@10.20.30.20 systemctl restart nginx
}

$auth = (Get-website - name "ws" | findstr "Start")
if($auth)
{
    "IIS ok"    
}
else
{
    "IIS no ok"
    Start-IISSite -name "ws"
}

#echo ((curl http://ls.pre.nsc50.com -Headers @{Authorization="Basic XXXXXXXXXXX"}).statuscode -eq 200) ? "OK" : "NO"
#auth 到 F12 network抓
pause

