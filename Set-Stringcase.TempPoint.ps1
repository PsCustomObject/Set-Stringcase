function Set-Stringcase
{
	<#
	.SYNOPSIS
		Function will convert case of a string.
	
	.DESCRIPTION
		Function nwill convert case of a string.
		
		The TitleCase parameter will produce a string with the first character capitalized. It has to be noted converted string could be linguistically not correct.
	
	.PARAMETER StringToConver
		The string that needs to have case converted
	
	.PARAMETER LowerCase
		Will convert all characters in the string to lowercase.
	
	.PARAMETER UpperCase
		Will convert all characters in the string to uppercase.
	
	.PARAMETER TitleCase
		Will convert all characters in the string to Title Case.
	
	.EXAMPLE
		PS C:\> Set-Stringcase -StringToConver 'Test string' -ToTitleCase

		Test String
#>
	
	[CmdletBinding(DefaultParameterSetName = 'TitleCase',
				   HelpUri = 'https://pscustomobject.github.io/powershell/PowerShell-Convert-to-Title-Case/',
				   SupportsPaging = $false,
				   SupportsShouldProcess = $false)]
	[OutputType([string], ParameterSetName = 'TitleCase')]
	[OutputType([string], ParameterSetName = 'LowerCase')]
	[OutputType([string], ParameterSetName = 'UpperCase')]
	[OutputType([string])]
	param
	(
		[Parameter(ParameterSetName = 'LowerCase',
				   Mandatory = $true)]
		[Parameter(ParameterSetName = 'TitleCase')]
		[Parameter(ParameterSetName = 'UpperCase',
				   Mandatory = $true)]
		[ValidateNotNullOrEmpty()]
		[Alias('String', 'Characters')]
		[string]$StringToConver,
		[Parameter(ParameterSetName = 'LowerCase')]
		[swith]$LowerCase,
		[Parameter(ParameterSetName = 'UpperCase')]
		[switch]$UpperCase,
		[Parameter(ParameterSetName = 'TitleCase')]
		[switch]$TitleCase
	)
	
	switch ($PsCmdlet.ParameterSetName)
	{
		'LowerCase'
		{
			# Convert string to lower case
			[string]$returnString = $StringToConver.ToLower()
			
			return $returnString
			
			break
		}
		'UpperCase'
		{
			# Convert string to lower case
			[string]$returnString = $StringToConver.ToUpper()
			
			break
		}
		'TitleCase'
		{
			# Normalize string
			$StringToConver = $StringToConver.ToLower()
			
			# Convert string to title case
			[string]$returnString = (Get-Culture).TextInfo.ToTitleCase($StringToConver)
			
			break
		}
	}
}