// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
// import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
    

contract AMUTransfer is ERC20 {
    
    
    constructor()  ERC20("Amarachi Marycynthia Ugwu", "AMU")  {
        // _mint(msg.sender, amount);
    }
    // AMU token amount to send to buyer
    function mint (address recipient, uint amount) external {
        _mint(recipient, amount);
    }
    
}