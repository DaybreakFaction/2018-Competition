#Requires -Version 5.0
$script:ModuleRoot = $PSScriptRoot
$script:ModuleVersion = "1.0.0.0"

function Import-ModuleFile {
    <#
        .SYNOPSIS
            Loads files into the module on module import.
        
        .DESCRIPTION
            This helper function is used during module initialization.
            It should always be dotsourced itself, in order to proper function.
            
            This provides a central location to react to files being imported, if later desired
        
        .PARAMETER Path
            The path to the file to load
        
        .EXAMPLE
            PS C:\> . Import-ModuleFile -File $function.FullName
    
            Imports the file stored in $function according to import policy
    #>
    [CmdletBinding()]
    Param (
        [string]
        $Path
    )
    
    if ($doDotSource) {
        . $Path
    } else {
        $ExecutionContext.InvokeCommand.InvokeScript($false, ([scriptblock]::Create([io.file]::ReadAllText($Path))), $null, $null)
    }
}

# Detect whether at some level dotsourcing was enforced
$script:doDotSource = Get-PSFConfigValue -FullName Daybreak2018.Import.DoDotSource -Fallback $false
if ($Daybreak2018_dotsourcemodule) { 
    $script:doDotSource = $true
}

# Add prerequisties to this location


# Importing public and private functions
$Public  = @( Get-ChildItem -Path $PSScriptRoot\Public\*.ps1 -Recurse -ErrorAction SilentlyContinue )
$Private = @( Get-ChildItem -Path $PSScriptRoot\Private\*.ps1 -Recurse -ErrorAction SilentlyContinue )

#Dot source the files
Foreach($import in @($Public + $Private))
{
    Try
    {
        Import-ModuleFile -Path $import.fullname
    }
    Catch
    {
        Write-Error -Message "Failed to import function $($import.fullname): $_"
    }
}