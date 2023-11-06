 // SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
// // Example1
// contract Student {
// string private stdName;
// uint private stdRollNum;
// // setting values of state variables

// constructor (string memory name,uint rollNum) {
// stdName = name;
// stdRollNum = rollNum; }
// }

// contract StudentsList {
// // array to store students ( composition )
// Student[] public students;
// constructor (){
// Student newStudent = new Student("Burak", 20);
// students.push(newStudent);
// }
// }


// // Example2
// contract person{
//     string public name;
//     uint public age;
//     constructor(string memory _name , uint _age){
//         name = _name;
//         age = _age;
//     }
// }
// contract patient is person{
//     string public disease;
//     constructor(string memory _name , uint _age, string memory _disease)  person('Ali' , 20){
//         name = _name ;
//         age = _age;
//         disease = _disease;
//     } 
// }
// contract patientList{
//     patient[] public patientDetails;

//     function newpatient(string memory _name , uint _age, string memory _disease) public {
//     patient patients = new patient(_name , _age , _disease);
//     patientDetails.push(patients);
//     }

//     function getpatientList(uint _index) public view returns(string memory , uint , string memory){
//         require(_index >= 0 , "Index sholud be greater than zero.");
//         patient patientVar = patientDetails[_index];
//         return (patientVar.name() , patientVar.age(), patientVar.disease());
//     }
// }

// // Try/Catch
// contract PrimeChecker{
// constructor(uint a){
// require(a != 0, "Invalid Entry");
// assert(a != 1);
// }
// function isPrime(uint256 b) internal pure returns (bool) {
// if (b <= 1) {
// return false; 
// }
// if (b == 2) {
// return true;
//  }
// if (b % 2 == 0) {
// return false; 
// }
// for (uint256 i = 3; i * i <= b; i += 2) {
// if (b % i == 0) {
// return false;
// }
// }
// return true;
// }
// function onlyPrime(uint256 b) external pure returns (bool success) {
// // revert when a non-prime number is entered
// require(isPrime(b), "Ups! Reverting");
// success = true; 
// }
// }

// contract TryCatch {
// // success event
// event SuccessEvent();
// // failure event
// event CatchEvent(string message);
// event CatchByte(bytes data);

// PrimeChecker even;
// constructor() {
// even = new PrimeChecker(2);
// }

// function execute(uint amount) external returns (bool success) {

// try even.onlyPrime(amount) returns(bool _success){
// emit SuccessEvent();
// return _success;
// }
// catch Error(string memory reason){
// // if call fails
// emit CatchEvent(reason);
// }
// }

// function executeNew(uint a) external returns (bool success) {
// try new PrimeChecker(a) returns(PrimeChecker _even){
// // if call succeeds
// emit SuccessEvent();
// success = _even.onlyPrime(a);
// } 
// catch Error(string memory reason) {
// emit CatchEvent(reason);
// }
// catch (bytes memory reason) {
// emit CatchByte(reason);
// }
// }
// }
// Example3
contract SimpleDivision{
    function Divide2Nums(uint _divident , uint _divisor) public pure returns(uint result){
        require(_divisor > 10 , 'Divisor should be greater than zero.');
        result = _divident/_divisor;
        return result;
    }
}
contract TryCatchExample{
event Failure(string);
event Succesfully(string);
SimpleDivision simpleDiv=new SimpleDivision();

function division(uint num1,uint num2)public returns(uint result){
    try simpleDiv.Divide2Nums(num1,num2){
        emit Succesfully("Success");
        return result;
    }
    catch Error(string memory data){
      emit Failure(data);
    }
}
}


// Library
// Example1
// library Explibrary {

// function exponential( uint256 a, uint256 b) public pure returns (uint256) {
// return a ** b ;
// }
// }
// contract SumContract {
// function sum( uint256 a, uint256 b) public pure returns (uint256) {
// return a + b ;
// }
// }
// contract LibraryClient{
//     SumContract sumcontractVar = new SumContract();
    
// function GetExponential(uint256 firstVal, uint256 secondVal)public pure returns(uint256) {
// return Explibrary.exponential(firstVal, secondVal);
// }
// function Sum(uint256 firstVal, uint256 secondVal) public view returns(uint256) {
// return sumcontractVar.sum(firstVal, secondVal);
// }
// }

// // Library
// Example2
// library Lib{
//     function Sum(uint num1 , uint num2) public pure returns(uint result) {
//       return result = num1 + num2;
//     }
//     function Difference(uint num1 , uint num2) public pure returns(uint result){
//         require(num2 > 0, "Number should be greater than zero");
//         return result = num1 - num2;
//     }
//     function Power(uint num1 , uint num2) public pure returns(uint result){
//         require(num2 > 0, "Power should be greater than zero.");
//         return num1 ** num2;
//     }
// }
// contract lib1{
//     event successful(string);
//     event failure(string);

//     function GetSum(uint256 num1, uint256 num2)public pure returns(uint256) {
//     return Lib.Sum(num1, num2);
//     }
//     function GetDifference(uint256 num1, uint256 num2)public {
//         try Lib.Difference(num1, num2) returns(uint){
//             emit successful("Successful.");
//         }
//         catch  Error( string memory data){
//             emit failure(data);
//         }
//     }
//     function GetPower(uint256 num1, uint256 num2)public {
//         try Lib.Power(num1, num2) returns(uint){
//             emit successful("Successful.");
//         }
//         catch  Error( string memory data){
//             emit failure(data);
//         }
//     }
// }