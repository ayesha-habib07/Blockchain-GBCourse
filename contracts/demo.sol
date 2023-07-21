// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// contract Mapping {
//     // Mapping from address to uint
//     mapping(string => address) public myMap;

//     function get(string memory _i) public view returns (address) {
//         // Mapping always returns a value.
//         // If the value was never set, it will return the default value.
//         return myMap[_i];
//     }

//     function set(address _addr, string memory _i) public {
//         // Update the value at this address
//         myMap[_i] = _addr;
//     }
//     // function remove(address _addr) public {
//     //     // Reset the value to the default value.
//     //     delete myMap[_addr];
//     // }
// }


// contract NestedMapping {
//     // Nested mapping (mapping from address to another mapping)
//     mapping(address => mapping(uint => bool)) public nested;

//     function get(address _addr1, uint _i) public view returns (bool) {
//         // You can get values from a nested mapping
//         // even when it is not initialized
//         return nested[_addr1][_i];
//     }

//     function set(address _addr1, uint _i, bool _boo) public {
//         nested[_addr1][_i] = _boo;
//     }

//     function remove(address _addr1, uint _i) public {
//         delete nested[_addr1][_i];
//     }
// }


contract testing{
    mapping (string => address) public map;
    function sett(address add , string memory aa) public {
        map[aa] = add;
    }
    function gett(string  memory aa) public view  returns(address){
         return  map[aa];

    }
}
contract nestedmap{
    mapping (address=> mapping(uint => bool)) public nest;
    function sett(address add , uint x , bool boool) public {
        nest [add][x] = boool;
    }
    function gett( address add , uint x) public view returns(bool){
        return  nest[add][x];
    }
}
