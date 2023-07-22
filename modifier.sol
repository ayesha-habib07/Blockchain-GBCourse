// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
// contract Loops{
// uint[] public arr;
// uint public p = 5;
// function Loop(uint k) public returns(uint[] memory) {
//     while(k<5){
//         arr.push(p);
//         p = p * p;
//         k++;
//     }
//     return arr;
// }
// }

// contract Dowhile{
//     uint j=3;
//     uint[] public arr2;

//     function DOwhile() public returns (uint[] memory){
//         uint i = 0;
//         do{
//             i++;
//             arr2.push(j);
//             j *= j;
//         }
//         while(i < 5);
//         return  arr2;
//     }
// }
// contract Mapping{
//     mapping (string => uint) public map;
//     function get(string memory name) public view returns (uint){
//         return map[name];
//     }
//     function set(string memory name , uint regno) public {
//         map[name] = regno;
//     }
//     function del(string memory name) public{
//        delete   map[name];
//     }
// }
// contract MappingPractice{
//     mapping (address => mapping(string => uint)) public map;
//     function set( address adr , string memory name , uint regno) public{
//         map[adr][name] = regno;
//     }
//     function get(address adr, string memory name) public view returns(uint ){
//         return map[adr][name];
//     }
// }

// arrays
contract Arrays{
    uint[] public arr= [10,20,30,40];
    function getElememts(uint x) public view returns(uint){
        return arr[x];
    }
    function addElements(uint x , uint value) public{
        arr[x] = value;
    }
    function getArray() public view returns(uint[] memory){
        return arr;
    }
    function getLength() public view returns(uint){
    return arr.length;
    }
    function pushElements(uint x) public{
        arr.push(x);
    }
    function popElements() public{
        arr.pop();
    }
    // length of the array remain same after deleting elements.
    function deleting(uint x) public {
        delete  arr[x];
    }  
}

