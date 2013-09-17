#!/usr/local/bin/bash

# 引数の型チェック 数値以外はエラーとする
checkType() {
  A=`echo "$1" | sed -e 's/[a-zA-Z]//g'`

  if [ "$1" = "$A" ]; then
    return 0
  else
    return 1
  fi
}

# 引数を*2して返す
multBy2() {
  checkType $1

  if [ $? -eq 0 ]; then
    expr $1 \* 2
  else
    echo "引数エラー: 引数には数値を使用してください"
    return 1
  fi
}

