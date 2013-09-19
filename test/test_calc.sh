#!/usr/local/bin/bash

# セットアップ テストするファイルをincludeする
oneTimeSetUp() {
.  ../script/sample_functions.sh
}

# 引数が*2されることを確認する
testMultBy2() {
  res=`multBy2 3`
  assertEquals 6 ${res}
}

testMultBy10() {
  res=`multBy2 10`
  assertEquals 20 ${res}
}

# エラーメッセージが正しく表示されるかのテスト
testMultErrorMessage() {
  res=`multBy2 hoge`
  assertEquals "$res" "引数エラー: 引数には数値を使用してください"
}

# エラー発生時の終了ステータスのテスト
testMultErrorStatus() {
  res=`multBy2 hoge`
  assertFalse $?
}

# 引数は数値のみを使用するため、文字列を引数とした場合エラーとする

# 正常系 引数が数値の場合
testCheckInt1() {
  isInt? 9
  assertTrue $?
}

testCheckInt2() {
  isInt? 99999999
  assertTrue $?
}

# 異常系 引数が数値以外の場合
testCheckString1() {
 isInt? hoge
 assertFalse $?
}

testCheckString2() {
  isInt? 6gbkreo8
  assertFalse $?
}

testCheckString3() {
  isInt? 999beks
  assertFalse $?
}

. ../lib/shunit2-2.1.6/src/shunit2

