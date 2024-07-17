{ lib, pkgs, ... }:

{
  opts = {
    updatetime = 100;
    number = true;
    relativenumber = true;
    splitbelow = true;
    splitright = true;
    scrolloff = 4;
    autoindent = true;
    clipboard = "unnamedplus";
    expandtab = true;
    shiftwidth = 2;
    smartindent = true;
    tabstop = 2;
    laststatus = 3;
    wrap = false;
    ignorecase = true;
    incsearch = true;
    smartcase = true;
    wildmode = "list:longest";
    swapfile = false;
    undofile = true;
    termguicolors = lib.mkForce pkgs.stdenv.isLinux;
  };

  globals.mapleader = " ";
}
