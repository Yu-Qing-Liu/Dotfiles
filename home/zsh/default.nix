{ config, ... }:
{
  xdg.enable = true;

  programs.zsh = {
    enable = true;
    autocd = true;
    # Absolute path via XDG:
    dotDir = "${config.xdg.configHome}/zsh";
    autosuggestion.enable = true;
    enableCompletion = true;

    shellAliases = {
      ls = "ls --color=auto";
      grep = "grep --color=auto";
      n = "nvim $1";
      r = "ranger-cd";
      ranger = "ranger-cd";
      toggle_kb = "toggle-kb";
      dev = "nix develop --impure -c $SHELL";
      l = "lazygit";
    };

    initContent = builtins.readFile ../../dev/zsh/zshrc.zsh;

    oh-my-zsh = {
      enable = true;
      custom = "${config.home.homeDirectory}/.oh-my-zsh/custom";
      theme = "custom";
      plugins = [ "command-not-found" "git" "history" "sudo" ];
    };
  };

  home.file.".oh-my-zsh/custom/themes/custom.zsh-theme".text =
    builtins.readFile ../../dev/zsh/custom.zsh-theme;

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}

