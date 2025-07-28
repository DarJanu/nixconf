set -e
git diff -U0 *.nix
echo "NixOS Rebuilding..."
sudo nixos-rebuild switch --flake ~/nixconf#denkplatte &>nixos-switch.log || (
 cat nixos-switch.log | grep --color error && false)
gen=$(nixos-rebuild list-generations | grep current)
git commit -am "$gen"
