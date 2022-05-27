param (
        $TaskName = "", 
        [Int32]$TriggerSeconds, 
        [Int32]$WaitSeconds
)

function Run_Task {

        $taskAction = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "cd $(Get-Location) ; ./open.ps1" 
        $TriggerSeconds = New-TimeSpan -Minutes ($TriggerSeconds / 60)
        $taskTrigger = New-ScheduledTaskTrigger -Once -At (Get-Date) -RepetitionInterval "$TriggerSeconds"
        $description = "Run the open.ps1 script"
    
        Unregister-ScheduledTask -TaskName "$TaskName" -Confirm:$false -ErrorAction silent    
        Register-ScheduledTask -TaskName $TaskName -Action $taskAction -Trigger $taskTrigger -Description $description	    
        Get-ScheduledTask -TaskPath \*
        Start-Sleep $WaitSeconds                
        Disable-ScheduledTask -TaskName $TaskName
        Write-Host -BackgroundColor Black -ForegroundColor Yellow "`nPress any key to continue..."
        [void][System.Console]::ReadKey($true)
        
}

function Get_Params {

        if (!($TaskName) -or $TaskName -eq "") {
                Write-Host -BackgroundColor Black -ForegroundColor Red "No task name was entered"
                exit 1
        }

        if ($TriggerSeconds -lt 0) {
                Write-Host -BackgroundColor Black -ForegroundColor Red "Trigger seconds must be zero or more"
                exit 1                    
        }

        if ($WaitSeconds -lt 0) {                    
                Write-Host -BackgroundColor Black -ForegroundColor Red "Wait seconds must be zero or more"
                exit 1
        }
        Run_Task   
}
        
Get_Params