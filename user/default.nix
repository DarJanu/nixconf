{
  config,
  pkgs,
  inputs,
  ...
}: {
  # Define a user account.
  users.users.jetti = {
    #use "mkpasswd -m sha-512" to generate a hashedPassword and replace it with this one.
    hashedPassword = "$6$bMpG93GDeSRyiL/p$MmeWu/DTk9LcLLe.PR5MPh4lI47cv15Y6dXioKfej55TzG8xt5fO9CMKof145CTkuckfFAt4XCTY.ISiYOhsj.";
    isNormalUser = true;
    description = "Jetthaichal Janu";
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [
      kdePackages.kate
      kitty
    ];
    shell = pkgs.zsh;
  };
  # Enable automatic login for the user.
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "jetti";
}
