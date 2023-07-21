// SPDX-License-Identifier: MITfunc
pragma solidity ^0.8.17;
contract variables{
    // state variables
    string public text = "HELLO";
    uint public num1 = 123;
    uint public num2;
    uint public age;
    uint public lastClaimed;
    uint duration = 60;
    function f1() public view returns (uint){
        uint local = 15;
        return local  + num1;
    
    }
    function f2() public view  returns (uint){
         uint xyz  = num1 + 10;
         return  xyz;

    }    
    constructor() {
        lastClaimed = block.timestamp;
    }
    function send_ether_from_faucet() public {
        uint now_time = block.timestamp;
        address sender = msg.sender;
        uint

    }

}