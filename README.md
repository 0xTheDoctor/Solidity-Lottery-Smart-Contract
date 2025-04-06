# 🎰 Solidity Lottery Smart Contract

This is a simple Ethereum-based Lottery smart contract written in Solidity. It allows multiple participants to enter by sending 1 ETH, and the contract host can select a random winner to receive the entire contract balance.

## 🔧 Features

- Anyone can participate by sending exactly **1 ETH**
- The host **cannot** enter the lottery
- Only the host can pick the winner
- Automatically transfers the entire balance to the selected winner
- Players list resets after each round
- Utility functions to get contract balance and players list

## 📜 Contract Overview

```solidity
function participate() public payable;
function pickWinner() public;
function getPlayers() public view returns(uint256, address payable[]);
function getContractBalance() public view returns(uint);
function randomWinnerSelect() public view returns(uint);
```