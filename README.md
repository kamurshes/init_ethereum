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

`$ geth attach rpc:http://localhost:8545 console`

`var bin="0x608060405234801561001057600080fd5b5060df8061001f6000396000f3006080604052600436106049576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff16806360fe47b114604e5780636d4ce63c146078575b600080fd5b348015605957600080fd5b5060766004803603810190808035906020019092919050505060a0565b005b348015608357600080fd5b50608a60aa565b6040518082815260200191505060405180910390f35b8060008190555050565b600080549050905600a165627a7a72305820221d1028681eb95f1413d15f0c920af216b2c0da1ccf5d107139ec331cf7481c0029"`

`var abi=[{"constant":false,"inputs":[{"name":"x","type":"uint256"}],"name":"set","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"get","outputs":[{"name":"retVal","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"}]`

`var contract = eth.contract(abi)`

`personal.unlockAccount(eth.accounts[0],"AmrA3i7B",300)`

`var cnt = eth.contract(myContract.abi).at(myContract.address)`



# 実際に作成した時のメモ

[200~var bin="0x608060405234801561001057600080fd5b506040516020806102cb83398101806040528101908080519060200190929190505050806000803373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020016000208190555050610245806100866000396000f30060806040526004361061004c576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff16806370a0823114610051578063a9059cbb146100a8575b600080fd5b34801561005d57600080fd5b50610092600480360381019080803573ffffffffffffffffffffffffffffffffffffffff16906020019092919050505061010d565b6040518082815260200191505060405180910390f35b3480156100b457600080fd5b506100f3600480360381019080803573ffffffffffffffffffffffffffffffffffffffff16906020019092919080359060200190929190505050610125565b604051808215151515815260200191505060405180910390f35b60006020528060005260406000206000915090505481565b6000816000803373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020016000205410156101765760009050610213565b816000803373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060008282540392505081905550816000808573ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060008282540192505081905550600190505b929150505600a165627a7a7230582045ceb670afed208f494635d7b638b23684f4b17c1b5055af5cb649074269bfd60029"

var abi=[{"constant":true,"inputs":[{"name":"","type":"address"}],"name":"balanceOf","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_to","type":"address"},{"name":"_value","type":"uint256"}],"name":"transfer","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"inputs":[{"name":"initialSupply","type":"uint256"}],"payable":false,"stateMutability":"nonpayable","type":"constructor"}]

var contract = eth.contract(abi)

personal.unlockAccount(eth.accounts[0],"AmrA3i7B",300)

var supply = 10


var token = contract.new(supply, { from: eth.accounts[0], data: bin, gas: '500000'})

 0x8b6044e601C30E529A768475DAc7bA3b75AeA95b

token.transfer.sendTransaction(eth.accounts[1],2,{from:eth.accounts[0],gas:100000})

token.balanceOf(eth.accounts[0])



パラメーター

受取主：eth.accounts[0]
目標額：0.001 eth
実施期間：600分
トークン価格(/ETH)：0.0005/ETH

var _recipient = eth.accounts[0]
var _targetAmount = web3.toWei(0.001,"ether")
var _duration = 600
var _price = web3.toWei(0.0005,"ether")
var _reward = token.address


var crowdsale_bin="0x608060405234801561001057600080fd5b5060405160a08061082b8339810180604052810190808051906020019092919080519060200190929190805190602001909291908051906020019092919080519060200190929190505050846000806101000a81548173ffffffffffffffffffffffffffffffffffffffff021916908373ffffffffffffffffffffffffffffffffffffffff16021790555083600181905550603c830242016003819055508160048190555080600560006101000a81548173ffffffffffffffffffffffffffffffffffffffff021916908373ffffffffffffffffffffffffffffffffffffffff16021790555050505050506107218061010a6000396000f30060806040526004361061008e576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff168063046aa70d1461026f57806329dcb0cf1461028657806366d003ac146102b15780636e66f6e914610308578063953b8fb81461035f578063a035b1fe1461038a578063c59ee1dc146103b5578063dc0d3dff146103e0575b34801561009a57600080fd5b50600034905060408051908101604052803373ffffffffffffffffffffffffffffffffffffffff1681526020018281525060068080548091906001016100e09190610675565b8154811015156100ec57fe5b906000526020600020906002020160008201518160000160006101000a81548173ffffffffffffffffffffffffffffffffffffffff021916908373ffffffffffffffffffffffffffffffffffffffff1602179055506020820151816001015590505080600260008282540192505081905550600560009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1663a9059cbb33600454848115156101aa57fe5b046040518363ffffffff167c0100000000000000000000000000000000000000000000000000000000028152600401808373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200182815260200192505050602060405180830381600087803b15801561023057600080fd5b505af1158015610244573d6000803e3d6000fd5b505050506040513d602081101561025a57600080fd5b81019080805190602001909291905050505050005b34801561027b57600080fd5b50610284610454565b005b34801561029257600080fd5b5061029b6105bf565b6040518082815260200191505060405180910390f35b3480156102bd57600080fd5b506102c66105c5565b604051808273ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200191505060405180910390f35b34801561031457600080fd5b5061031d6105ea565b604051808273ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200191505060405180910390f35b34801561036b57600080fd5b50610374610610565b6040518082815260200191505060405180910390f35b34801561039657600080fd5b5061039f610616565b6040518082815260200191505060405180910390f35b3480156103c157600080fd5b506103ca61061c565b6040518082815260200191505060405180910390f35b3480156103ec57600080fd5b5061040b60048036038101908080359060200190929190505050610622565b604051808373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020018281526020019250505060405180910390f35b6000600354421015156105bc576001546002541015156104cc576000809054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff166108fc6002549081150290604051600060405180830381858888f1935050505050610582565b600090505b600680549050811015610581576006818154811015156104ed57fe5b906000526020600020906002020160000160009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff166108fc60068381548110151561054757fe5b9060005260206000209060020201600101549081150290604051600060405180830381858888f193505050505080806001019150506104d1565b5b6000809054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16ff5b50565b60035481565b6000809054906101000a900473ffffffffffffffffffffffffffffffffffffffff1681565b600560009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1681565b60015481565b60045481565b60025481565b60068181548110151561063157fe5b90600052602060002090600202016000915090508060000160009054906101000a900473ffffffffffffffffffffffffffffffffffffffff16908060010154905082565b8154818355818111156106a2576002028160020283600052602060002091820191016106a191906106a7565b5b505050565b6106f291905b808211156106ee57600080820160006101000a81549073ffffffffffffffffffffffffffffffffffffffff02191690556001820160009055506002016106ad565b5090565b905600a165627a7a72305820f4798364d3c8ac456f05cc9be52b9f004c884ff0a626792237fdc76dc29513a30029"

var crowdsale_abi=[{"constant":true,"inputs":[{"name":"","type":"address"}],"name":"balanceOf","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_to","type":"address"},{"name":"_value","type":"uint256"}],"name":"transfer","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"inputs":[{"name":"initialSupply","type":"uint256"}],"payable":false,"stateMutability":"nonpayable","type":"constructor"},{"constant":false,"inputs":[],"name":"checkTargetAchieved","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"deadline","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"recipient","outputs":[{"name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"tokenReward","outputs":[{"name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"targetAmount","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"price","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"raisedAmount","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"","type":"uint256"}],"name":"funders","outputs":[{"name":"addr","type":"address"},{"name":"amount","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"inputs":[{"name":"_recipient","type":"address"},{"name":"_targetAmount","type":"uint256"},{"name":"_duration","type":"uint256"},{"name":"_price","type":"uint256"},{"name":"_reward","type":"address"}],"payable":false,"stateMutability":"nonpayable","type":"constructor"},{"payable":false,"stateMutability":"nonpayable","type":"fallback"}]

var crowdsaleContract = eth.contract(crowdsale_abi)

personal.unlockAccount(eth.accounts[0],"AmrA3i7B",300)

var crowdsale = crowdsaleContract.new(_recipient,_targetAmount,_duration,_price,_reward,{from:web3.eth.accounts[0],data:crowdsale_bin,gas: 1000000})

0xf6DdF5fD98d797490b9109749Dc8103B6DFbb0d0

token.transfer.sendTransaction( 0x4F9E4b4053106513C8021c61aed15659b524F7d4,2,{from:eth.accounts[0],gas:100000})

0xd6be67a719a611f4f88221be6a15f1207beea90c3f635888409584378c1fd59c

コントラクトアドレス：0x099d3224f2E6Cf77C86eEa3D7518da8024a72326

var contract_address=0x099d3224f2E6Cf77C86eEa3D7518da8024a72326

eth.sendTransaction({from:eth.accounts[0],to:"0x099d3224f2E6Cf77C86eEa3D7518da8024a72326",value:web3.toWei(0.0005,"ether"),gas:100000})
