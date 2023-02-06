$scriptBody = "using module  $PSScriptRootCustomOutput"
$script = [ScriptBlock]::Create($scriptBody)
. $script