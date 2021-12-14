{ config, pkgs, ... }: 
with import <nixpkgs> {};
with builtins;
with lib;
{
#  home.file = {
#    ".config/zsh".source = fetchFromGitHub {
#	owner = "chmouel";
#	repo = "zsh-config";
#	rev = "master";
#	sha256 = "0w327w8naiqrgl7yi732l7ljvwjf8j66w6kpk10dgq1ggbhbp267"; 
#      };
#    };
  programs.zsh = {
        enable = true;
        dotDir = ".local/share/zsh";
        initExtra = ''

        _z=$HOME/.config/zsh
        if [[ -d $_z ]];then 
        export ZDOTDIR=$_z   
        reload=true
                source $ZDOTDIR/.zshrc
        fi	
        export EMOJI_CLI_USE_EMOJI=true
        export ZSH_TAB_TITLE_ONLY_FOLDER=true
        export ZSH_TAB_TITLE_DEFAULT_DISABLE_PREFIX=true
        alias rebuild="rm -f ~/.zshenv;sudo nixos-rebuild switch --fast;yadm alt"
        alias vi=vim
        alias vim=nvim
        path+=($HOME/.local/bin $HOME/.local/bin/desktop)
        '';
        zplug = {
         enable = true;
         plugins = [
           { name = "zsh-users/zsh-autosuggestions"; } # Simple plugin installation
           { name = "agkozak/zsh-z"; }
           { name = "andrewferrier/fzf-z"; }
           { name = "b4b4r07/emoji-cli"; }
           { name = "trystan2k/zsh-tab-title";  }
        ];
      };
    };
}
