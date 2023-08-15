// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
// contract Loop{
//  uint[] public arr;
//  function NaturalNum(uint max) public returns(uint[] memory){
//  uint i = 4;
//  while(i <= max){
//  arr.push(i);
//  i=i+4;
//  }
//  return arr; }}


//  contract NumberProcessor {
//  function calculateSumAndAverage(uint256[5] memory numbers) public pure
// returns (uint256 average) {
//  uint256 totalSum = 0;
//  uint256 i = 0;
//  while(i < numbers.length) {
//  totalSum += numbers[i];
//  i++;
//   }
//  average = totalSum / numbers.length;
//  }
// }

// contract FibonacciSeries {
//  function generateFibonacci(uint256 n) public pure returns (uint256[]
// memory) {
//  uint256[] memory fibonacciSeries = new uint256[](n);
//  if (n >= 1) {
//  fibonacciSeries[0] = 0; }
//  if (n >= 2) {
//  fibonacciSeries[1] = 1; }
//  uint i = 2;
//  while(i < n){
//   fibonacciSeries[i] = fibonacciSeries[i - 1] + fibonacciSeries[i - 2];
//   i++;
//  }
//  return fibonacciSeries; }
// }

// contract Loop{
// //The value of cond that you will input will decide
// //the number of times the loop is run
// function iterate(uint cond) public pure returns(uint){
// uint i;
// uint iteration;
// do {
// iteration ++;
// i++;
// } while(i < cond);
// //If you input the value of 'cond' as 0, the condition will be false
// //on the first try, however you will notice that the loop still runs once
// return iteration;
// }}


// contract Loop{
//  uint[] public arr;
//  function ODDNum(uint max) public{
//  uint i = 1;
//  while(i <= max){
//  if (i % 2 != 0)
//  arr.push(i);
//  i++;
//  }
//  }
//  function get() public view returns(uint[] memory){
//  return arr;
//  }
// }
// contract dowhile{
//     uint[] public arr;
//     function oddNumber(uint max) public {
//         uint i = 0;
//         do{
//             if(i%2 != 0)
//             arr.push(i);
//             i++;
//         }
//         while(i <= max);
//     }
// function get() public view returns(uint[] memory){
//     return arr;
// }
// }


// contract ForLoop{
// uint[] public numtable;
// function table(uint num) public{
// uint temp = num;
// for(uint i = 1; i <= 20; num+=temp){
// numtable.push(num);
// num += temp;
// }
// }
// function get() public view returns(uint[] memory){
// return numtable;
// }
// function resetarr() public{
// delete numtable;
// }
// }


// contract ForLoop{
// int[5] public arr = [-9, 8, 7, -2, 1];
// int[] public positarr;
// function positivepart() public{
// for(uint i = 0; i < arr.length; i++){
// if(arr[i] >= 0){
// positarr.push(arr[i]);
// }
// }
// }
// function getposit() public view returns(int[] memory){
// return positarr;
// }
// int[] public negarr;
// function negativepart() public {
//     for (uint i= 0 ; i < arr.length ; i++){
//         if(arr[i] < 0){
//             negarr.push(arr[i]);
//         }
//     }
// }
// function getNegativePart() public view returns(int[] memory){
//     return negarr;
// }
// }

// contract Factorial{
// function createFact(uint n) public pure returns(uint){
// uint factvalue =1;
// if(n == 0){
// return factvalue;
// }
// //******** Insert For Loop Here***********
// for (uint i = 1 ; i <= n ; i++){
//     factvalue *= i;
// }
// return factvalue;
// }
// }

contract MerkleTree {
    uint[4] public arr = [1, 3, 4, 2]; //
    uint[] public arr1;//

    function copyItem() public {   
        arr1 = arr;
    }

function calculateSum() public {
    copyItem();
    uint count = arr.length;
    while (count > 0) {
        for (uint i = 1; i < count; i += 2) {
            if(count==2){
            uint total = arr1[arr1.length-1] +arr1[arr1.length-2];
            arr1.push(total);
            }
            else{
            uint total = arr[i - 1] + arr[i];
            arr1.push(total);
            }
        }
        count /= 2;
    }
}

function RootItem()public view returns (uint) {
    return arr1[arr1.length-1];
}
function returnArr()public view returns (uint[] memory) {
    return arr1;
}
}

