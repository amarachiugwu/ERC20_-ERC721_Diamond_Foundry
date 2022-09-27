// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
 

contract AMUSale {
    
    mapping(address => uint) public balances;
    address payable public owner;
    
    constructor () {
        owner = payable(msg.sender);
    }

     modifier min(uint _minAmount) {
        require(msg.value >= _minAmount, 'Not enough Ether provided');
        _;
    }

    modifier max(uint _maxAmount) {
        require(msg.value <= _maxAmount, 'You cannot buy more than 2 Ether worth of AMU');
        _;
    }
     
    modifier reachedMaxBuy(uint _maxBal) {
        require((balances[msg.sender] + msg.value) <= _maxBal, 'You cannot purchase with this amount, Total Ether purchase cannot be more than 2 Ether');
        _;
    }

    // accept ether for AMU Token
    function deposit() public payable min(0.001 ether) max(2 ether) reachedMaxBuy(2 ether){
       
        owner.transfer(msg.value);
        balances[msg.sender] += msg.value;
    }
    
}