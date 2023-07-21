// SPDX-License-Identifier: MITfunc
pragma solidity ^0.8.17;
contract Quiz{
    uint public constant TAX =23;
    address public immutable owner;
    constructor(){
        owner = msg.sender;
    }  
}