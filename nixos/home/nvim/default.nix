{ config, pkgs, ... }: 
with import <nixpkgs> {};
with builtins;
with lib;
let 
  unstable = import <nixpkgs-unstable> { };
in
{
 home.packages = with pkgs; [
    nodePackages.pyright tree-sitter unstable.code-minimap
    luaPackages.lua-lsp rnix-lsp nodePackages.vim-language-server
    nodePackages.yaml-language-server nodePackages.bash-language-server
    nodePackages.vscode-json-languageserver-bin
    nodePackages.vscode-html-languageserver-bin
    nodePackages.vscode-css-languageserver-bin
    unstable.neovim
  ];

 programs.neovim = {
    vimAlias = true;
    viAlias = true;
 };
    #enable = true;
#    plugins = with pkgs.vimPlugins; [
#       vimPlugins.vim-packer
    # tpope/vim-commentary
    # nvim-telescope/telescope.nvim
    # nvim-lua/plenary.nvim
    # Mofiqul/dracula.nvim
    # neovim/nvim-lspconfig
    # L3MON4D3/LuaSnip
    # abecodes/tabout.nvim
    # dense-analysis/ale
    # ruanyl/vim-gh-line
    # kevinhwang91/nvim-hlslens
    # cespare/vim-toml
    # lukas-reineke/format.nvim
    # LnL7/vim-nix
    # hrsh7th/nvim-cmp
    # hrsh7th/vim-vsnip
    # hrsh7th/cmp-buffer
    # hrsh7th/cmp-nvim-lsp
    # terryma/vim-expand-region
    # NTBBloodbath/doom-one.nvim
    # nvim-treesitter/nvim-treesitter
    # nvim-treesitter/nvim-treesitter-textobjects
    # romgrk/barbar.nvim
    # kyazdani42/nvim-tree.lua
    # kyazdani42/nvim-web-devicons
    # hoob3rt/lualine.nvim
    # projekt0n/github-nvim-theme
#    ];
    # extraConfig = builtins.concatStringsSep "\n" [
    # ''
    #   set autochdir
    #   set sw=2
    #   set et
    #   set nohlsearch
    # ''
    # ];
  #};
}
