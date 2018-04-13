<#
.SYNOPSIS
    Generates a random password.
.DESCRIPTION
    This function generates a random password that meets default AD requirements.
.EXAMPLE
    $Password = New-Password
.INPUTS
    Optional password length. Optional maximum number of special characters.
#>
Function New-Password {
    [CmdletBinding()]
    param (
        [int]$length = 10,
        [int]$maxNA = 4
    )
    
    do {
        $pswd = [System.Web.Security.Membership]::GeneratePassword($length, $maxNA)
        $g = $pswd -split '' | Where-Object {$_ -ne ''} | Group-Object | Sort-Object Count -Descending
    } while ($g[0].Count -ne 1 -or $pswd -notmatch '[a-zA-Z]' -or $pswd -notmatch '[0-9]')

    Write-Output $pswd
}
