#requires -Version 7
[CmdletBinding()]
param([Parameter(Mandatory)][uri]$Endpoint)
$ErrorActionPreference = 'Stop'
if (!$Endpoint.IsAbsoluteUri -or $Endpoint.Scheme -ne 'https' -or $Endpoint.UserInfo) {
    throw 'Use the approved absolute HTTPS endpoint supplied by your service owner.'
}
$secret = Read-Host 'Integration key' -AsSecureString
try {
    $credential = [pscredential]::new('integration', $secret)
    Invoke-RestMethod -Method Get -Uri $Endpoint -Headers @{
        'X-API-Key' = $credential.GetNetworkCredential().Password
    } -MaximumRedirection 0 -TimeoutSec 30
} finally { $secret.Dispose() }
