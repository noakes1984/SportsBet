const HDWalletProvider = require("truffle-hdwallet-provider");
const Web3 = require("web3");
const { interface, bytecode } = require("./compile");

const provider = new HDWalletProvider(
  "normal fan three soul miss hybrid cherry fly cause spot spot parade",
  "https://rinkeby.infura.io/rho9s29MMMyAD7hpgDab"
);
const web3 = new Web3(provider);

const deploy = async () => {
  const accounts = await web3.eth.getAccounts();

  console.log("Attempting to deploy from account", accounts[0]);

  const result = await new web3.eth.Contract(JSON.parse(interface))
    .deploy({ data: "0x" + bytecode })
    .send({ from: accounts[0], gas: "3000000" });

  console.log(interface);
  console.log("Contract deployed to", result.options.address);
};
deploy();

/*
const HDWalletProvider = require('truffle-hdwallet-provider');
const Web3 = require('web3');
const { interface, bytecode } = require('./compile');

const provider = new HDWalletProvider(
  'vibrant force liquid flavor rapid woman angry moon thought follow injury reason',
  'https://rinkeby.infura.io/rho9s29MMMyAD7hpgDab'
);
const web3 = new Web3(provider);

const deploy = async () => {

    const accounts = await web3.eth.getAccounts();

    console.log('Attempting to deploy from account', accounts[0]);

    const result = await new web3.eth.Contract(JSON.parse(interface))
    .deploy({ data: bytecode })
    .send({ gas: '1000000', from: accounts[0] });

    //console.log(interface);
    console.log('Contract deployed to', result.options.address);

};
deploy();
*/
