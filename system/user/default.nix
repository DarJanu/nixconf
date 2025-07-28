{ flake, pkgs, config, ... }: {
  users.users.jetti = {
    isNormalUser = true;
    description = "Jetthaichal Janu";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
      thunderbird
      kitty
    ];
    shell = pkgs.zsh;
  };
  # Enable automatic login for the user.
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "jetti";
}
