{ config, pkgs, inputs, ... }: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jetti = {
    isNormalUser = true;
    description = "Jetthaichal Janu";
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [
      kdePackages.kate
      thunderbird
      kitty
    ];
    shell = pkgs.zsh;
  };
}