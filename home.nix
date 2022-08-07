{ config, pkgs, ... }:

{
# Home Manager needs a bit of information about you and the
# paths it should manage.
  home.username = "jo";
  home.homeDirectory = "/Users/jo";

# This value determines the Home Manager release that your
# configuration is compatible with. This helps avoid breakage
# when a new Home Manager release introduces backwards
# incompatible changes.
#
# You can update Home Manager without changing this value. See
# the Home Manager release notes for a list of state version
# changes in each release.
  home.stateVersion = "22.05";

# Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  home.packages = [ pkgs.nodejs ];

# begin fish
  programs.zsh = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      switch = "home-manager switch";
      build = "home-manager build";
      home-edit = "nvim ~/.config/nixpkgs/home.nix";
    };
    zplug = {
      enable = true;
      plugins = [
      { name = "plugins/git"; tags = [ from:oh-my-zsh ]; }
      { name = "junegunn/fzf"; tags = [ from:gh-r as:command use:'*darwin*arm64*' ]; }
      { name = "themes/robbyrussell"; tags = [ from:oh-my-zsh ]; }
      ];
    };
  };
# end fish
  programs.git = {
    enable = true;
    userName = "Jo";
    userEmail = "95hyouka@gmail.com";
  };
  programs.fzf.enable = true;	
  programs.tmux.enable = true;
  programs.gpg.enable = true;
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withNodeJs = true;
    plugins = with pkgs.vimPlugins; [
      vim-airline
      tokyonight-nvim
    ];
    coc = {
      enable = true;
    };
    extraConfig = ''
      set number
      set relativenumber
      set autoindent
      set mouse=a
      set encoding=UTF-8
      set autoindent
      set smartindent
      set shiftwidth=4
      set softtabstop=4
      set expandtab
      syntax enable
      colorscheme tokyonight
      filetype plugin indent on
      autocmd FileType nix setlocal shiftwidth=2 softtabstop=2 expandtab
      '';
  };
}
