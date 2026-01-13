# ローカルでの CI 実行（act を使う）

概要
- このリポジトリは GitHub Actions で `zmkfirmware/zmk` の再利用ワークフローを使っています。
- `act` はローカルで GitHub Actions ワークフローを実行するツールですが、リモートの reusable workflow を自動で取り込めないため、リモートファイルをローカルにダウンロードして参照先を置き換える補助スクリプトを用意しました。

準備
1. Docker を起動してください（Docker Desktop for Mac 等）。

2. act をインストールします（いずれか）：

Homebrew（推奨）:
```bash
brew install act
```

もし `brew` が使えない場合（Homebrew が未インストール）:
```bash
# 最新リリースのバイナリをダウンロードして手動で配置（例）
curl -sLo act.tar.gz "https://github.com/nektos/act/releases/latest/download/act_darwin_amd64.tar.gz"
tar -xzf act.tar.gz
sudo mv act /usr/local/bin/
```

使用方法
```bash
# 最初に実行権を付与
chmod +x scripts/*.sh

# リモートの reusable workflow をダウンロードし、ローカル参照に置き換えた workflow を生成して act を実行します
./scripts/run-act.sh
```

注意点
- `act` はランナー環境や Docker イメージの違いで完全一致しない場合があります。ビルドに失敗したら、代替案として `docker run` で `zmkfirmware/zmk-build-arm:stable` コンテナを使い、`west` コマンドを直接実行してください（README に例あり）。
- ワークフローがシークレットを必要とする場合は `--secret` または `--env-file` を `act` に渡してください。
