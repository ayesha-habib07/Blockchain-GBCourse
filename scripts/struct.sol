// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract student {
    struct StudentStruct{
        string name;
        uint age;  // Changed the type to uint 
    }
    
    // StudentStruct public student; // Changed the variable name to lowercase "student"
    mapping(address => StudentStruct) students;
    // StudentStruct public student;
    
    function setName(string memory _name ,address _add) public {
        students[_add].name = _name; // Changed Student to student
    }
  function setName(uint _age, address _add) public {
        students[_add].age = _age; // Changed Student to student
    }
//     function setAge(uint _age) public {
//         student.age = _age; // Changed Student to student and updated the data type to uint
//     }
}

