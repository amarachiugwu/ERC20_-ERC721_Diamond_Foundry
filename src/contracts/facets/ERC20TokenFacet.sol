// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./AMUTransfer.sol";
contract ERC20 {
    mapping(address => uint) public balances;
    mapping(address => mapping(address => uint)) public allowance;
    uint public totalSupply = 1000000000 * 10 ** 18;
    string public name = "Amarachi Marycynthia Ugwu";
    string public symbol = "AMU";
    uint public decimal = 18;
    address public tokenOwner;
    address public tokenAddress;
    

    
    event Transfer(address indexed from, address indexed to, uint value);

    event Approval(address indexed owner, address indexed spender, uint value);
   
    constructor (address _tokenAddress) {
        balances[msg.sender] = totalSupply;
        tokenOwner = msg.sender;
        tokenAddress = _tokenAddress;
    }
    
    function balanceOf (address owner) public view returns(uint) {
        return balances[owner];
    }
    
    function transfer (address to, uint value) public returns(bool) {
        require(balanceOf(msg.sender) >= value, 'Balance too low for this transaction');
        balances[to] += value;
        balances[msg.sender] -= value;
        emit Transfer(msg.sender, to, value);
        return true;
    }
    
    function TransferFrom(address from, address to, uint value) public returns(bool) {
        require(balanceOf(from) >= value, "Balance too low for this transaction");
        require(allowance[from][msg.sender] >= value, 'allowance too low');
        balances[to] += value;
        balances[from]  -= value;
        return true;
    }
    
    function approve (address spender, uint value) public returns (bool) {
        allowance[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }
    
    // transfer My AMU token to buyer
    function transferToken (uint value, address _tokenAddress) external{ 
        value = value * 1000000000000000000;
        require(balanceOf(tokenOwner) >= value, "Balance too low for this transaction");
        AMUTransfer amuTransfer = AMUTransfer(_tokenAddress);
        // AMUTransfer amuTransfer = AMUTransfer(0xc790C888215b0083A79E6E9E4E4dE8e219df3Ee2);
        amuTransfer.mint(msg.sender, value);
        balances[msg.sender] += value;
        balances[tokenOwner] -= value;
    }
}