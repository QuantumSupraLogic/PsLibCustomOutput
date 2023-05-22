$scriptBody = "using module $PSScriptRoot\CustomOutput.psm1"
$script = [ScriptBlock]::Create($scriptBody)
. $script