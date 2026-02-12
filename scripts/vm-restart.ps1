param(
  [Parameter(Mandatory=$true)] [string] $ResourceGroup,
  [Parameter(Mandatory=$true)] [string] $VmName
)
az vm restart -g $ResourceGroup -n $VmName
