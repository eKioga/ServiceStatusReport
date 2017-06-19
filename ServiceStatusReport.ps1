# << Service Status Report >> Conact Eric Post for help.
# Variables below are for editing the style of the HTML thats generated at the end.
$a = "<style>"
$a = $a + "BODY{background-color:gainsboro;}"
$a = $a + "TABLE{border-width: 1px;border-style: solid;border-color: black;border-collapse: collapse;}"
$a = $a + "TH{border-width: 1px;padding: 0px;border-style: solid;border-color: black;background-color:limegreen}"
$a = $a + "TD{border-width: 1px;padding: 0px;border-style: solid;border-color: black;background-color:whitesmoke}"
$a = $a + "</style>"
# Text to be displayed BEFORE the table. Note: the 'every five minutes' reference below is due to how often the task for this script will run.
$Pre = "Status refreshes every five minutes."
# Text to be displayed AFTER the table
$Post = "Missing Application? Contact Eric Post to add more."
# Replace 'servername' with the server that is hosting the services.
# Replace 'serviceName' with the name of the service(s) you want to include on this report.
icm servername {Get-Service -name serviceName1, serviceName2} `
| ConvertTo-Html Status,DisplayName,PSComputerName, `
# Edit Title and Body text if you wish 
-title "Critical Application Status" `
-body "<H2>Critical Application Status</H2>" `
-head $a -PreContent $Pre -PostContent $Post `
# Then it generates the HTML file and places it in a specific directory.
# Note that in this case, the local server also ran an IIS service.
| Set-Content C:\inetpub\wwwroot\app_status.htm