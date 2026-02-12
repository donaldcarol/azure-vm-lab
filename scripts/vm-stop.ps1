param(
  [Parameter(Mandatory=$true)] [string] $ResourceGroup,
  [Parameter(Mandatory=$true)] [string] $VmName,
  [switch] $Deallocate
)

az vm stop -g $ResourceGroup -n $VmName
if ($Deallocate) {
  az vm deallocate -g $ResourceGroup -n $VmName
}
