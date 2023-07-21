// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.17 and less than
// 0.9.0
pragma solidity ^0.8.17;
contract StateVariable {
uint constant constPI = 31415;    
uint public storedData; // State variable
constructor() {
storedData = 10; // Using State variable
}
function calculateArea(uint radius) public pure returns (uint){
    uint area = constPI * radius *radius;
    return area;
} 
}
