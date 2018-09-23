# Schedule de bkp
Clear-Host
get-command -module psschedulejob | Sort-Object noun

$diario = New-JobTrigger -Daily -at 3am 
$Semanal = New-JobTrigger -Weekly -DaysOfWeek monday -at 6pm
$umavez = New-JobTrigger -Once -at (get-date).addhours(1)


Register-ScheduledJob -name Backup_Semanal -Trigger $semanal -ScriptBlock {
Copy-Item F:\Curriculo\*.* F:\Backup -Recurse -Force
}

Get-ScheduledJob backup_semanal 
| Unregister-ScheduledJob
Get-JobTrigger