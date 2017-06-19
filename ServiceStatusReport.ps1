$a = "<style>"
$a = $a + "BODY{background-color:gainsboro;}"
$a = $a + "TABLE{border-width: 1px;border-style: solid;border-color: black;border-collapse: collapse;}"
$a = $a + "TH{border-width: 1px;padding: 0px;border-style: solid;border-color: black;background-color:limegreen}"
$a = $a + "TD{border-width: 1px;padding: 0px;border-style: solid;border-color: black;background-color:whitesmoke}"
$a = $a + "</style>"
$Pre = "Status refreshes every five minutes."
$Post = "Missing Application? Contact Eric Post to add more."
icm aei-pdq {Get-Service -name PDQDeploy, PDQInventory} | ConvertTo-Html Status,DisplayName,PSComputerName, -title "AEI Critical Application Status" -body "<H2>AEI Critical Application Status</H2>" -head $a -PreContent $Pre -PostContent $Post | Set-Content C:\inetpub\wwwroot\app_status.htm