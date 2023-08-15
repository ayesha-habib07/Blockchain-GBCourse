// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract EncapFuncCalls {
function someFuncWithManyInputs(uint x,uint y,uint z,address a,bool b,string memory c) public pure returns (uint _x,uint _y,uint _z,address _a,bool _b,string memory _c ) {
_x = x;
_y = y;
_z = z;
_a = a;
_b = b;
_c = c;
}
function callFunc() external pure returns (uint _x,uint _y,uint _z,address _a,bool _b,string memory _c ) {
    return someFuncWithManyInputs(1, 2, 3, address(0), true, "Simple Function Call");
}
function callFuncWithKeyValue() external pure returns (uint _x,uint _y,uint _z,address _a,bool _b,string memory _c ) {
return
someFuncWithManyInputs({a: address(0), b: true, c: "Function Call with Key Value", x: 1, y: 2, z: 3});
}
}


contract func{
function create1(string memory _name , string memory _gender, address _address ) public pure returns (string  memory name,string memory gender ,address Address){
    name = _name;
    gender = _gender;
    Address = _address;
    return (name , gender , Address);
}
function create2() external pure returns(string  memory name,string memory gender ,address Address){
    return  create1('ayesha' , 'female' ,0x5B38Da6a701c568545dCfcB03FcB875f56beddC4 );
}
function create3() external pure returns (string memory name , string memory gender ,address Address){
    return create1({_name: 'ayesha', _gender : 'female',_address  :0x5B38Da6a701c568545dCfcB03FcB875f56beddC4});
}
    uint public  constant  pi = 3141592653589793238;
function circumference(uint _radius) public pure returns (uint result){
    result = 2 * pi * _radius;
}
}

contract FunctionTypes{
uint public number = 4;
// default
function add() public{
number += 2;
}
// pure
function addPure() public {
number += 2;
}
// view
function addView() public  {
number += 2;
}}



contract fixedSizedArray{
    uint[4] public arr1=[1,2,3,4];
    function set()public {
        arr1[0] = 2;
        arr1[3] = 10;
    }
    function get() public view  returns (uint[4] memory){
        return arr1;
    }
}


contract dynamicSizedArray{
    string[] public arr2;
    function push(string memory _name) public returns(uint){
        arr2.push(_name);
        return arr2.length;
    }
    function pop() public{
        arr2.pop();
    }
    function get()public view returns(string[] memory){
        return arr2;
        
    }
    }







// for practice
// contract DArray {
// uint[] public arr;
// function getlength() public view  returns(uint){
//     return arr.length;
// }
// int[] public arr1;
// function upush(int _x) public{
// arr1.push(_x);
// }
// function pop()public {
//     arr1.pop();
// }
// function udelete(uint _index) public{
// delete arr1[_index];
// }
// function udelete1() public{
// delete arr1;
// }


// uint[2] public arr2 = [5, 6];
// function get1() public view returns(uint[2] memory){
//     return arr2;
// }
// uint[] public arr3;
// function get2() public view returns(uint[] memory){
// return arr3;
// }
// }

