# 🧑‍💻 Dotfiles

## Requirements

This project is best used with [GNU Stow](https://www.gnu.org/software/stow/). Doing so will allow for running the commands below for configuring your envionment. If it not availabe, you should be able to copy files to their appropriate locations manually in order to make it work. Keeping things in sync may prove tricky though. 🤷

## 💻 macOS

When setting up for macOS, be sure to clone this repository to `~/.dotfiles`. Once done, navigate to `~/.dotfiles` in your terminal. Once there, run the following command.

> `stow zsh shell`

This will configure zsh and the shell. For local overrides for your machine, create a `~/.shell_local_rc` file and make changes there. It will be loaded last.

## 🐧 Linux

When setting up for Linux, be sure to clone this repository to `~/.dotfiles`. Once done, navigate to `~/.dotfiles` in your terminal. Once there, run the following command.

> `stow bash shell`

This will configure zsh and the shell. For local overrides for your machine, create a `~/.shell_local_rc` file and make changes there. It will be loaded last.

