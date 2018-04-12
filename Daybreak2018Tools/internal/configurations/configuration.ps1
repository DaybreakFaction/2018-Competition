<#
This is an example configuration file

By default, it is enough to have a single one of them,
however if you have enough configuration settings to justify having multiple copies of it,
feel totally free to split them into multiple files.
#>

<#
# Example Configuration
Set-PSFConfig -Module 'Daybreak2018Tools' -Name 'Example.Setting' -Value 10 -Initialize -Validation 'integer' -Handler { } -Description "Example configuration setting. Your module can then use the setting using 'Get-PSFConfigValue'"
#>
Set-PSFConfig -Module psmoduledevelopment -Name template.store.daybreak2018tools -Value "$($script:ModuleRoot)\templates" -Validation string -Description "Path to the daybreak tools templates"