param(
  [Parameter(Mandatory=$true)] [string] $ResourceGroup,
  [Parameter(Mandatory=$true)] [string] $VmName
)

az vm get-instance-view -g $ResourceGroup -n $VmName `
  --query "instanceView.statuses[?starts_with(code,'PowerState/')].displayStatus | [0]" -o tsv
