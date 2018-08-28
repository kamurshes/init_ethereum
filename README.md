# Ethereumのスマートコントラクト

## Solidityのインストール

`sudo add-apt-repository ppa:ethereum/ethereum`
`sudo apt-get update`
`sudo apt-get install solc`


## Solidityのバージョンを確認する

`solc --version`

solc, the solidity compiler commandline interface
Version: 0.4.24+commit.e67f0147.Linux.g++

## スマートコントラクトの作成・実行フロー

1. コントラクトコードを作成する
2. コントラクトコードのコンパイルを実行する
3. 「Contract」アカウントを生成する

3.1. コンパイル済みのコードをトランザクションに付加してネットワークへ送信する

3.2. トランザクションを受信したマイナーはトランザクションをブロックチェーンへ登録する

3.3. 「Contract」アドレスはマイニングが完了された後アドレスが発行される

4. スマートコントラクトへのアクセス・実行

スマートコントラクトを実行したいユーザーはContractアカウントへトランザクションを発行することによりスマートコントラクトを実行することができる。

## コントラクトコードをコンパイルする

1. 「ファイル名.sol」を作成
2. solc --abi --bin ファイル名.sol

`$ vi SingleNumRegister.sol`

`$ solc --abi --bin SingleNumRegister.sol`


======= SingleNumRegister.sol:SinglNumRegister =======

Binary:

608060405234801561001057600080fd5b5060df8061001f6000396000f3006080604052600436106049576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff16806360fe47b114604e5780636d4ce63c146078575b600080fd5b348015605957600080fd5b5060766004803603810190808035906020019092919050505060a0565b005b348015608357600080fd5b50608a60aa565b6040518082815260200191505060405180910390f35b8060008190555050565b600080549050905600a165627a7a72305820221d1028681eb95f1413d15f0c920af216b2c0da1ccf5d107139ec331cf7481c0029

Contract JSON ABI

[{"constant":false,"inputs":[{"name":"x","type":"uint256"}],"name":"set","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"get","outputs":[{"name":"retVal","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"}]

