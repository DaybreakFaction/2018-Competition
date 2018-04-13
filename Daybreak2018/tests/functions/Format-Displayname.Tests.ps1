. .\internal\functions\Format-DisplayName.ps1

Describe "Format-DisplayName" {
        $a = "john"
        $b = "lewis"
        $Results = Format-DisplayName -FirstName $a -Surname $b

    it "outputs LAST First" {
        $Results | Should Be "LEWIS John"
    }
}