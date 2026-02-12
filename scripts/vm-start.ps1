param(
  [Parameter(Mandatory=$true)] [string] $ResourceGroup,
  [Parameter(Mandatory=$true)] [string] $VmName
)
az vm start -g $ResourceGroup -n $VmName
