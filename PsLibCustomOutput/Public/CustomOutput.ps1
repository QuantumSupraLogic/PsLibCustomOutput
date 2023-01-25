
class CustomOutput {
    [CustomOutputType] $outputType

    CustomOutput([string] $outputType) {
        $this.outputType = [CustomOutputType]::new()
        $this.outputType = $outputType
    }
    CustomOutput([CustomOutputType] $outputType) {
        $this.outputType = $outputType
    }

    [void] WriteCustomOutput([string] $message) {
        switch ($this.outputType) {
            Console { Write-Host $message }
            File { throw (New-Object System.NotImplementedException) }
            EventLog { Write-CustomEventLog -message $message }
            None { }
        }
    }

    [void] WriteCustomEventLog([string] $message) {
        Write-EventLog -LogName Application -Source "NAV PS Scripts" -EventId 1 -EntryType Information -Message $message
    }
}

enum CustomOutputType {
    Console
    File
    Event_Log
    None
}