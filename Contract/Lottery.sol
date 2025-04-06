// SPDX-License-Identifier: MIT

pragma solidity ^0.8.2;

contract Lottery {
    address public host;
    address public winner;
    address payable [] public players;

    constructor(){
        host = msg.sender;
    }

    modifier entryrestictions(){
        require(msg.value == 1 ether,"Need ether to enter lottery");
        require(msg.sender != host, "Host cannot participate in the lottery");
        _;
    }

    function participate() public entryrestictions payable{
        players.push(payable(msg.sender));
    }

    function getPlayers() public view returns(uint256,address payable[] memory) {
        return (players.length, players);
    }

    function getContractBalance() public view returns(uint) {
        return address(this).balance;
    }

    function randomWinnerSelect() public view returns(uint){
        return uint8(uint256(keccak256(abi.encodePacked(block.timestamp,block.difficulty,players)))%256);
    }

    function pickWinner() public{
        require(host==msg.sender);
        require(players.length > 0, "No players in the lottery");
        uint256 index = randomWinnerSelect()%players.length;
        winner = players[index];
        players[index].transfer(address(this).balance);

        players = new address payable[](0);
    }
}