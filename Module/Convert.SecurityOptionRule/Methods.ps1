# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.
#region Method Functions
<#
 .SYNOPSIS
    Parses Check-Content element to retrieve the Security Options Policy name
#>
function Get-SecurityOptionName
{
    [CmdletBinding()]
    [OutputType([string])]
    param
    (
        [parameter(Mandatory = $true)]
        [string[]]
        $CheckContent
    )

    Write-Verbose "[$($MyInvocation.MyCommand.Name)]"

    # use a regular expression to pull the user string from between the quotes
    $Option = ( $CheckContent |
            Select-String -Pattern $script:regularExpression.textBetweenQuotes -AllMatches )

    If ( $Option )
    {
        $Option = $Option.Matches.Groups[3].Value
        Write-Verbose "[$($MyInvocation.MyCommand.Name)] Security Option : $Option "
        return $option
    }
    else
    {
        Write-Verbose "[$($MyInvocation.MyCommand.Name)] Security Option : Not Found"
        return
    }
}

<#
 .SYNOPSIS
    Parses Check-Content element to retrieve the Security Policy value
#>
function Get-SecurityOptionValue
{
    [CmdletBinding()]
    [OutputType([string])]
    Param
    (
        [parameter(Mandatory = $true)]
        [string[]]
        $CheckContent
    )

    Write-Verbose "[$($MyInvocation.MyCommand.Name)]"

    # use a regular expression to pull the user string from between the quotes
    $option = ( $CheckContent |
            Select-String -Pattern $script:regularExpression.textBetweenQuotes -AllMatches )

    if ( $option )
    {
        $Option = $Option.Matches.Groups[5].Value
        Write-Verbose "[$($MyInvocation.MyCommand.Name)] Security Option : $option "
        return $option
    }
    else
    {
        Write-Verbose "[$($MyInvocation.MyCommand.Name)] Security Option : Not Found"
        return
    }
}
#endregion
