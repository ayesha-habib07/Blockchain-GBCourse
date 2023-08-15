//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
// contract events{
// mapping(address => uint)  _balances; 
// // uint Transfer;
// event Transfer(address indexed from, address indexed to, uint256 value);

//     function _transfer(address from, address to, uint256 amount) external
// {
//  _balances[from] = 10000000; // give some initial tokens to transfer address
//  _balances[from] -= amount; // "from" address minus the number of transfer
//  _balances[to] += amount; // "to" address adds the number oftransfer
//       // emit event
//  emit Transfer(from, to, amount); }
// }
// contract Event {
//  // Event declaration
//  // Up to 3 parameters can be indexed.
//  // Indexed parameters helps you filter the logs by the indexed parameter
//  event Log(address indexed sender, string msg);
// //  address public v = address(0);
//  event AnotherLog();
//  event newevent(string name ,address contactAddress,string department);
//  function test() public {
//  emit Log(msg.sender, "On");
//  emit Log(msg.sender, "It's all about Decentralization");
//  emit AnotherLog();
//  emit newevent("AYesha",msg.sender,"computer Science");
//  }
// }
// contract person{
//     struct personalInfo{
//         string name;
//         uint age;
//         string department;
//     }
//     personalInfo public p1;
//     event update(personalInfo oldValue,personalInfo newValue,uint timestamp,uint blockNumber);

//     function set(string memory _name,uint _age, string memory _dept)public{
//         personalInfo memory oldValue = p1;
//         p1.name=_name;
//         p1.age=_age;
//         p1.department=_dept;
//         emit update( oldValue, p1, block.timestamp, block.number);
//     }
// }
// contract ownersAddress{
//     address public owner;
//     event ZeroAddressInputted(string message);
//     constructor(address _initialOwner){
//        owner = _initialOwner;
//        if(_initialOwner == address(0)){
//        emit ZeroAddressInputted("Zero Address inputted on deployment of contract");
//        }
//     }
// }
contract noprime{
 uint public num;
 event PrimeChecker(string, uint);
 function setter(uint _inputNum) public{
     num = _inputNum;

 }
 function PrimeNo() public view returns (bool is_prime ) {
 uint j =2;
 is_prime= true;
 if (num == 0 || num == 1) {
 is_prime = false;
 }
 while (j <= num/2 ) {
 if (num % j == 0) {
 is_prime = false;
 break; }
 j++; }
}
function check(uint number) public {
    bool n= PrimeNo();
if (n)
emit PrimeChecker('The Number is Prime', number);
else
emit PrimeChecker('The Number is not Prime', number);
}
}