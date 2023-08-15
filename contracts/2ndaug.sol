// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
// contract TicketBookingSystem{
// enum TicketType{
//     Economy, 
//     Business,
//     FirstClass
// }
// enum Days{
//     Monday, 
//     Tuesday,
//     Wednesday,
//     hursday, Friday,
//     Saturday, 
//     Sunday
// }
// struct Ticket{
//     string passengerName;
//     TicketType  tickettype;
//     Days day;
//     bool isBooked;
// }
// Ticket[] public tickets;
// function bookTicket( string memory _passengerName,TicketType  _tickettype, Days _days,bool _isBooked) public{
    
//     Ticket memory  newVar;
//     newVar.passengerName = _passengerName;
//     newVar. tickettype =  _tickettype;
//     newVar.day = _days;
//     newVar. isBooked =  _isBooked;
//     tickets.push(newVar);
// } 
// function  getTicketType(uint _index) public view returns (TicketType){

//     Ticket memory nameOfTicket = tickets[_index];
//     return (nameOfTicket.tickettype);
// }
// function getTicketDay(uint _index) public  view returns (Days){
//     Ticket memory nameOfDay = tickets[_index];
//     return (nameOfDay.day);
// }
// function  toggleStatus(uint256 _index ) public{
//     Ticket storage booked = tickets[_index];
//     booked.isBooked = !booked.isBooked;
// }
// }
// contract Loop {
// function PrimeChecker(uint _num) public pure returns (bool is_prime ) {
//  uint j =2;
//  is_prime= true;
//  if (_num == 0 || _num == 1) {
//  is_prime = false;
//  }
//  while (j <= _num/2 ) {
//  if (_num % j == 0) {
//  is_prime = false;
//  break; }
//  j++; }
// }
// }

// contract Loop {
//  function Palindrome(uint input) public pure returns (bool) {
//  uint temp = input;
//  uint digit;
//  uint rev;
//  do{
//  digit = temp % 10;
//  rev = (rev * 10) + digit;
//  temp = temp / 10;
//  } while (temp != 0);
//  if (input == rev)
//  return true;
//  else
//  return false; }
// }
// contract Loop {
// uint[] data;
// function loop() public returns (uint[] memory) {

//  for (uint8 i = 0; i < 20; i=i+2) {
//  data.push(i);
//  }
//  return data;
// }
// }
// contract Loop {
// uint[] data;
// function loop() public returns (uint[] memory) {

//  for (uint8 i = 1; i < 20; i=i+2) {
//  data.push(i);
//  }
//  return data;
// }
// }
// contract ControlFlow {
// // while
//  function whileTest() public pure returns(uint256){
//  uint sum = 0;
//  uint i = 0;
//  while(i < 15){
//  sum += i;
//  i++; }
//  return(sum);
//  }
//  function forTest() public pure returns(uint256){
//  uint sum = 0;
//  uint i = 0;
//  for(i=0 ;i< 15 ; i++){
//      sum = sum +i;
//  }
//  return (sum);
//  }
//  function dowhileTest() public pure returns (uint256){
//     uint sum = 0;
//     uint i = 0;
//      do{
//      sum = sum +i;
//      i++;
//      }
//      while( i< 15);
//      return (sum);
     
//  }
// } 



