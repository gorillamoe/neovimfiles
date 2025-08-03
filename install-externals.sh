#!/usr/bin/env bash

# Language Servers
bun install --global \
  @prisma/language-server \
  @tailwindcss/language-server \
  bash-language-server \
  diagnostic-languageserver \
  dockerfile-language-server-nodejs \
  eslint \
  intelephense \
  sql-language-server \
  svelte-language-server \
  typescript \
  typescript-language-server \
  vim-language-server \
  vscode-langservers-extracted \
  yaml-language-server

# PHP Language Server - https://intelephense.com/faq.html
# - put license key in ~/intelephense/licence.txt

# Install Lua Language Server
# https://github.com/LuaLS/lua-language-server

# Install Lua Linters
sudo luarocks install \
  luacheck
cargo install stylua

# Install Shellcheck and Markdown Linter and pipx
sudo pamac install shellcheck vale python-pipx

# Install Python Linters
pipx install \
  black \
  isort \
  pylint \
  pyright \
  pylsp-mypy
