<#
.SYNOPSIS
    Formats a user's first and last name as 'LAST First'

.DESCRIPTION
    Formats a user's first and last name as 'LAST First'
    Does not accept pipeline input
    Returns a string

.EXAMPLE
    PS C:>  Format-DisplayName -FirstName Joe -Surname Bloggs
    
    BLOGGS Joe

#>
function Format-DisplayName {
    [CmdletBinding()]
    param (
        [string]
        $FirstName,
        [String]
        $Surname
    )
    
    process {
        $FirstName = (Get-Culture).TextInfo.ToTitleCase($FirstName)

        $DisplayName = $Surname.ToUpper() + " " + $FirstName

        Write-Output $DisplayName
    }
}
