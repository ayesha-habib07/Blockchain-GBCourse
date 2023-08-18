// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
// Visiblity modifiers
// Public Modifier Example1
// contract Public{
// string public publicmsg = "Public Variable is Called";
// function getpublic() public view returns(string memory){
// return publicmsg;
// }
// }
// contract public2 is Public{

// }
// Example2
// contract PublicVisibility{
//     uint public publicData=10;
// }
// contract PublicChild is PublicVisibility{
//     function getPublicData()public view returns(uint){
//         return publicData;
//     }
// }
// Private modifier
// Example1
// contract Private{
// string public privatemsg = "Private Variable is Called";
// function getprivate() private view returns(string memory){
// return privatemsg;
// }
// function getprivatevar() public view returns(string memory){
// return privatemsg;
// }
// function getprivatefunc() public view returns(string memory){
// //You are calling 'getprivate()' function here
// //It returns a string value which is then returned by the
// //'getprivatefunc()' function
// return getprivate();
// }
// }
// contract Private2 is Private{
//     function Privatefunc() public returns (string memory){
//        return privatemsg = "Inherited msg";
//     }
// }
// Example2
// contract Bank{
//     uint private balance;
//     function deposit(uint funds) public returns (uint) {
//         balance = balance +funds;
//         return balance;
//     }
// }
// contract BankUser is Bank{
//     function deposit2() public{
//         deposit(5);
//     }
//     // private variable cannot be accessed
// // function get() public returns (uint){
// //     return balance;
// // }
// }
// Internal Modifier
// Example1
// contract Internal{
// string public internalmsg = "Internal Variable is Called";
// function getinternal() internal view returns(string memory){
// return internalmsg;
// }
// function getinternalvar() public view returns(string memory){
// return internalmsg;
// }
// function getinternalfunc() public view returns(string memory){
// return getinternal();
// }
// }
// contract internal2  is Internal {
//     function changeInternalmsg() public{
//         internalmsg = "Internal message is changed.";
//     }
// }
// Example2
// contract FamilyFortune{
//     uint internal inheritance;
//     function addInheritance(uint amount) internal{
//         inheritance = inheritance +amount;
//     }
// }
// contract Heir is FamilyFortune{
//     function newfunc(uint _amount) public{
//         addInheritance(_amount);
//     }
// }
// External modifier
// Example1
// contract External{
// // string external externalmsg = "External Variable is Called";
// function getexternal() external pure returns(string memory){
// return "External Function";
// }
// // function getexternalfunc() public view returns(string memory){
// // return getexternal();
// // }
// }
// contract External2 is External{
// //     function getexternalfunc() public view returns(string memory){
// // return getexternal();
// // }
// }


// Single inheritance
// Example1
// contract Base {
// uint public x;
// function setX(uint _x) private  {
// x = _x;
//    }
// }
// contract Derived is Base {
// function getX() public view returns (uint) {
// return x;
//    }
// }
// Example2
// contract Parent{
//     uint parentValue;
// }
// contract Child is Parent{
//     uint ChildValue;
// }


// Multiple Inheritance
// Example1
// contract Base {
// string public base = "Base Contract";
// function foo() public view virtual returns (string memory) {
// return base; }
// }
// contract Middle is Base {
// string public middle = "Middle Contract";
// function foo() public view virtual override returns (string memory) {
// return middle; }
// }
// contract Derived is Middle {
// string public derived = "Derived Contract";
// function foo() public view virtual override returns (string memory) {
// return derived; }
// }

// Example2
// contract BaseUser{
//     address public Address;
//     function setAddress(address _adr) public {
//         Address = _adr;
//     }

//     function print() public virtual returns(address ,string memory ){
//         return ( Address,'Base Address');
//     }
//     function returnAddress() public view  returns (address Addr) {
//         return Address;
//     }
// }
// contract Moderator is BaseUser{
//     string public name;
//     function setname( string memory _name) public {
//         name =_name;
//     }
//     function print() public view virtual override  returns(address , string memory){
//         return (Address,'Address in Moderator.');
//     }
//     function returnName() public view returns(string memory){
//         return( name);
//     }
// }
// contract Admin is Moderator{
//     uint public PIN;
//     function setPIn(uint _PIN) public{
//         PIN = _PIN;
//     }
//     function print()public view override returns (address , string memory){
//         return (Address,'Address in Admin');
//     }
//     function returnDetails() public view returns(address , string memory  _name , uint _PIN){
//         return (Address , name , PIN);
//     }
// }
// Direct and Indirect Initialization of constructor Example
// contract Base {
//  uint data;
//  constructor(uint _data) {
//  data = _data;
//  }
//  function Print() public virtual returns (string memory) {
//  return "Base Initialized";
//  }
// }
// contract Derived is Base(2) {
//  constructor() {}

//  function getData() external view returns (uint) {
//  uint result = data ** 2;
//  return result;
//  }

//  function Print() public virtual override returns (string memory) {
//  return "Direct Initialization";
//  }
// }
// contract Derived2 is Base {
//  constructor(uint _temp) Base(_temp) {}
//  function getData() external view returns (uint) {
//  uint result = data ** 4;
//  return result;
//  }
//  function Print() public pure virtual override returns (string memory) {
//  return "Indirect Initialization";
//  }
// }
// contract Caller {
//  Derived c = new Derived();
//  function getResult() public returns(uint){
//  c.Print();
//  return c.getData();
//  }
// }

// Hierarchical Inheritance
// Example1
// contract Base {
// uint public x;
// function setX(uint _x) public {
// x = _x; }
//  }
// contract DerivedA is Base {
// function getX() public view returns (uint) {
// return x; }
// }
// contract DerivedB is Base {
// function getXTimesTwo() public view returns (uint) {
// return x * 2; }
// }
// contract DerivedC is Base{
//     function getcubeofX() public view returns(uint){
//         return x * 3;
//     }
// }
// Example2
// contract Car{
//     uint public model;
//     string public  make;
// }
// contract ElectricCar is Car{
//     uint public batteryCapacity;
// }
// contract HybridCar is Car{
//     uint  public gasTankCapacity;
// }

// Multiple Inheritance
// Example1
// contract Engine{
//     uint public  horsepower;
// }
// contract Transmission{
//     string public gearType;
// }
// contract Car is Engine,Transmission{

// }

//  MUltiple Inheritance
// Example2
// contract WorkerRole{
//      bool  public submitWork;
// }
// contract ClientRole{
//     string public createProject;
// }
// contract Freelancer is WorkerRole,ClientRole{

// }

// Hybrid Inheritance
// Example 1
// contract Participant{

// }
// contract Supplier{
//     function placeOrder() public{

//     }

// }
// contract Manufacturer{
//     function manufactureProduct() public{

//     }

// }
// contract Product is Supplier,Manufacturer{
//     function trackProduct()public{

//     }

// }

// // Example2
// contract Car {
//     event Log(string message);

//     function demo() public virtual {
//         emit Log("Base Car demo Called");
//     }

//     function temp() public virtual {
//         emit Log("Base Car temp Called");
//     }
// }


// contract BMW is Car {
//     function demo() public virtual override {
//         emit Log("BMW demo called");
//     }

//     function temp() public virtual override {
//         emit Log("BMW temp called");
//         // super.temp();
//     }
// }

// contract TOYOTA is Car {
//     function demo() public virtual override {
//         emit Log("TOYOTA demo called");
//     }

//     function temp() public virtual override {
//         emit Log("TOYOTA temp called");
//         super.temp();
//     }
// }


// contract Supra is TOYOTA, BMW {
//     function demo() public override(TOYOTA, BMW) {
//         super.demo();
//     }

//     function temp() public override(TOYOTA, BMW) {
//         super.temp();
//     }
// }
