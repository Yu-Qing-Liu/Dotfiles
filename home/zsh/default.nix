{ config, ... }:
{
  home.file.".oh-my-zsh/custom/themes/custom.zsh-theme".text = builtins.readFile ../../dev/zsh/theme.zsh;
  # Enable Zsh
  programs.zsh = {
    enable = true;
    autocd = true;
    dotDir = ".config/zsh";
    autosuggestion.enable = true;
    enableCompletion = true;

    # Set custom aliases
    shellAliases = {
      ls = "ls --color=auto";
      grep = "grep --color=auto";
      n = "nvim $1";
      r = "ranger-cd";
      ranger = "ranger-cd";
    };

    initExtra = builtins.readFile ../../dev/zsh/zshrc.zsh;

    oh-my-zsh = {
      enable = true;
      custom = "${config.home.homeDirectory}/.oh-my-zsh/custom";
      theme = "custom";
      plugins = [
        "command-not-found"
        "git"
        "history"
        "sudo"
      ];
    };
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}
