. .\internal\functions\Format-DisplayName.ps1

Describe "Format-DisplayName" {
            $a = "john"
        $b = "lewis"
        $Results = Format-DisplayName -FirstName $a -Surname $b
        $last, $first = $Results.split(" ")
    it "will make the the last name uppercase" {
        $last | Should be $b.ToUpper()
    }
    it "will make the first name Title case" {
        $first | Should be (Get-Culture).TextInfo.ToTitleCase($FirstName)
    }

}