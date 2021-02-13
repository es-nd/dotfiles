#!/bin/zsh
# 配置したい設定ファイル(半角空白を空けてファイル名を記述)
dotfiles=(.zshrc)

# .zshrc と .tmux.conf という設定ファイルのシンボリックリンクを
# ホームディレクトリ直下に作成する
for file in "${dotfiles[@]}"; do
  ln -svf $file ~/
done

