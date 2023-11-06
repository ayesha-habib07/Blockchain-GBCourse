// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract ownable{
    address public owner;
    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender == owner,"Only owner can call this.");
        _;
    }
    event LogownerShipTransfered(address indexed _currentOwner ,address indexed newOwner);

    function transferOwnership(address newOwner)public onlyOwner{
        require(newOwner != address(0),"Invalid new address");
        emit LogownerShipTransfered(owner, newOwner);
        owner = newOwner;
    }
}