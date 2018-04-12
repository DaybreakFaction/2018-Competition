function Get-DBTClassTest
{
	[CmdletBinding()]
    Param (
        [Parameter(ValueFromPipeline = $true)]
	    $InputObject
	)
	
	begin
	{
		Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug','start','param'
	}
	process
	{
        foreach ($item in $Object) {
            $properties = @()
            $propertiesAssignment = @()
            $methods = @()
            
            $frame = @"
# Object of class to test
`$item = New-Object $($item.GetType().FullName)

#region Add in reasonable values into properties
{0}
#endregion Add in reasonable values into properties

Describe "Testing the class $($item.GetType().FullName)" {{
{1}
}}
"@
            
            $methodsToSkip = "ToString", "Equals", "GetHashCode", "GetType"
            
            foreach ($property in $item.PSOBject.Properties) {
                $properties = @"
    Context "Testing <$($item.GetType().Name)> Property $($property.Name)" {
        It "Should be of type '$($property.TypeNameOfValue)'" {
            `$item.PSOBject.Properties["$($property.Name)"].TypeNameOfValue | Should -Be "$($property.TypeNameOfValue)"
        }
        It "Should be safe to assign to" {
            { `$item.$($property.Name) = 0 } | Should -Not -Throw
        }
        It "Should be safe to read from" {
            { `$item.$($property.Name) } | Should -Not -Throw
        }
    }

"@
                $propertiesAssignment += "`$item.$($property.Name) = 0"
                
                $methodsToSkip += "get_($property.Name)"
                $methodsToSkip += "set_($property.Name)"
            }
            
            
            foreach ($method in $item.PSObject.Methods) {
                if ($methodsToSkip -contains $method.Name) { continue }
            }
        }
    }
    end
	{
	
	}
}