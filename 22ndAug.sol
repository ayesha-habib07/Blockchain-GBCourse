// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
// Example1
// interface Calculator {
// function getResult() external view returns(uint);
// }

// contract Temp is Calculator {
// constructor() {}
// function getResult() external pure returns(uint result){
// uint a = 2;
// uint b = 5;
// result = b / a;
// }
// }

// Example2
// contract Counter {
// uint public count =2;
// function square() external {
// count = count ** 2;
// }
// }

// interface ICounter {
// function count() external view returns (uint);
// function square() external;
// }

// contract MyContract {
// function squareCounter(address _counter) external {
// ICounter(_counter).square(); 
// }
// function getCount(address _counter) external view returns (uint) {
// return ICounter(_counter).count(); }
// }

// Example 3

// // Payable/nonpayable
// contract Payable {

// address payable public owner;
// constructor() payable {
// owner = payable(msg.sender);
// }

// function deposite() public payable returns (uint account, uint cont){
// cont = address(this).balance;
// account = owner.balance;
// }

// function notPayable() public view returns (uint account, uint cont){
// cont = address(this).balance;
// account = owner.balance;
// }
// }

// Example2
// contract PaymentContract{
//     address payable public owner;
//     constructor(){
//     owner = payable(msg.sender);
//    }
//     event success( uint amount , address);
//     function receivePayment(uint amount , address) public payable{
//     emit success(amount,msg.sender);
// }
// }