{
  config,
  pkgs,
  inputs,
  ...
}: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jetti = {
    hashedPassword = "$6$bMpG93GDeSRyiL/p$MmeWu/DTk9LcLLe.PR5MPh4lI47cv15Y6dXioKfej55TzG8xt5fO9CMKof145CTkuckfFAt4XCTY.ISiYOhsj.";
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
