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
