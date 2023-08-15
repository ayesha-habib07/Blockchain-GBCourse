// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
// contract Enum{

//     enum weekDay{
//         Monday,
//         Tuesday,
//         Wednesday,
//         Thursday,
//         Friday,
//         Saturday,
//         Sunday
//     }
//     mapping (address => weekDay ) public  map;
//     function set(weekDay _duty, address adr) public {
//         map[adr] = _duty;
//     }
//     function get(address adr) public view returns (weekDay){
//         return map[adr];
//     }

// }
contract Struct{

  enum weekDay{
        Monday,
        Tuesday,
        Wednesday,
        Thursday,
        Friday,
        Saturday,
        Sunday
    }
    struct strct{
         string Name;
         uint age;
         uint[10] childrenAge;
         weekDay dutyday;
    } 
      
    mapping (address => strct) public  map;
    function set(weekDay _duty, address adr,string memory name,uint age) public {
        map[adr].dutyday = _duty;
        map[adr].Name = name;
        map[adr].age = age;
    }
    function get(address adr) public view returns (weekDay,string memory,uint){
        return (map[adr].dutyday, map[adr].Name ,map[adr].age);
    }
}