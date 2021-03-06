<#
.SYNOPSIS
  Gets Catalog Information from Lenovo API.

.DESCRIPTION
  Gets Catalog Information from Lenovo API.

.PARAMETER <>
    The x of the .

.INPUTS
  <Inputs if any, otherwise state None>

.OUTPUTS
  <Outputs if any, otherwise state None - example: Log file stored in C:\Windows\Temp\<name>.log>

.NOTES
  Version:        0.0.1
  Author:         Alex Hedley
  Creation Date:  28/07/2019
  Release Date:   dd/mm/yyyy
  Purpose/Change: Initial script release
  
.EXAMPLE
  Call '' to

.FUNCTIONALITY
   Get-Catalog is intended to function as a mechanism for getting Catalog information from the Lenovo API.
#>

#=================== Dependencies ==========================
. Join-Path $PSScriptRoot ".\Private\logging.ps1"
. Join-Path $PSScriptRoot ".\Private\Invoke-LenovoApiRequest.ps1"
#=================== Dependencies ==========================

#region Initialisations
#---------------------------------------------------------[Initialisations]--------------------------------------------------------
#endregion Initialisations

#region Declarations
#----------------------------------------------------------[Declarations]----------------------------------------------------------
#endregion Declarations

#region Modules
#------------------------------------------------------------[Modules]-------------------------------------------------------------
#endregion Modules

#region Functions
#-----------------------------------------------------------[Functions]------------------------------------------------------------

function Get-Catalog
{
    <#
    .PARAMETER IncludeFutureProducts
        If ApiMode=V, results include future products.
    
    .EXAMPLE
        Get-Catalog -IncludeFutureProducts $true
    #>

    [CmdletBinding()]
    param(
        [bool]$IncludeFutureProducts
    )

    Begin
    {}
    Process
    {
        try
        {
            $resource += "Catalog"
            $method = "GET"
            if ($IncludeFutureProducts) {
                $query = "ApiMode=V"
            }

            $response = Invoke-LenovoApiRequest -Method $method -Resource $resource -Query $query
            return $response
        }
        catch
        {
            Write-Error $Error.item(0)
            #Log-Message $Error.item(0) Debug
        }
        finally
        {}
    }
    End
    {}
}

function Get-Catalog-Raw
{
    <#
    .PARAMETER IncludeFutureProducts
        If ApiMode=V, results include future products.
    
    .EXAMPLE
        Get-Catalog-Raw -IncludeFutureProducts $true
    #>

    [CmdletBinding()]
    param(
        [bool]$IncludeFutureProducts
    )

    Begin
    {}
    Process
    {
        try
        {
            $resource += "Catalog/Raw"
            $method = "GET"
            if ($IncludeFutureProducts) {
                $query = "ApiMode=V"
            }

            $response = Invoke-LenovoApiRequest -Method $method -Resource $resource -Query $query
            return $response
        }
        catch
        {
            Write-Error $Error.item(0)
            #Log-Message $Error.item(0) Debug
        }
        finally
        {}
    }
    End
    {}
}

function Get-Catalog-All
{
    <#
    .PARAMETER IncludeFutureProducts
        If ApiMode=V, results include future products.
    
    .EXAMPLE
        Get-Catalog-All -IncludeFutureProducts $true
    #>

    [CmdletBinding()]
    param(
        [bool]$IncludeFutureProducts
    )

    Begin
    {}
    Process
    {
        try
        {
            $resource += "Catalog/All"
            $method = "GET"
            if ($IncludeFutureProducts) {
                $query = "ApiMode=V"
            }

            $response = Invoke-LenovoApiRequest -Method $method -Resource $resource -Query $query
            return $response
        }
        catch
        {
            Write-Error $Error.item(0)
            #Log-Message $Error.item(0) Debug
        }
        finally
        {}
    }
    End
    {}
}

function Get-Catalog-Children
{
    <#
    .PARAMETER IncludeFutureProducts
        If ApiMode=V, results include future products.
    
    .EXAMPLE
        Get-Catalog-Children -IncludeFutureProducts $true
    #>

    [CmdletBinding()]
    param(
        [bool]$IncludeFutureProducts,
        [string]$ProductID
    )

    Begin
    {}
    Process
    {
        try
        {
            $resource += "Catalog/All"
            if ($ProductID) {
                $resource += "/$ProductID"
            }
            $method = "GET"
            if ($IncludeFutureProducts) {
                $query = "ApiMode=V"
            }
            
            $response = Invoke-LenovoApiRequest -Method $method -Resource $resource -Query $query
            return $response
        }
        catch
        {
            Write-Error $Error.item(0)
            #Log-Message $Error.item(0) Debug
        }
        finally
        {}
    }
    End
    {}
}

#endregion Functions

#region Execution
#-----------------------------------------------------------[Execution]------------------------------------------------------------
$response = Get-Catalog -IncludeFutureProducts $true
$response
#$response = Get-Catalog
#$response

$response = Get-Catalog-Raw -IncludeFutureProducts $true
$response
#$response = Get-Catalog-Raw
#$response

$response = Get-Catalog-All -IncludeFutureProducts $true
$response
#$response = Get-Catalog-All
#$response

$response = Get-Catalog-Children -IncludeFutureProducts $true
$response
#$response = Get-Catalog-Children
#$response

$response = Get-Catalog-Children -ProductID "CELL-PHONES" -IncludeFutureProducts $true
$response
#$response = Get-Catalog-Children -ProductID "CELL-PHONES"
#$response

#endregion Execution