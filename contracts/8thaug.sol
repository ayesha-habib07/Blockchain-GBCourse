//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract StudentRegistration {
    enum Department {
        Artificial_Intelligence,
        Blockchain,
        E_Commerce,
        Arts
    }
    enum Status {
        Enrolled,
        NotEnrolled,
        Graduated,
        Expelled
    }
    struct Student {
        string name;
        uint age;
        uint registrationDate;
        Department department;
        Status status;
        uint obtainedMarks;
    }
    mapping(uint => Student) public stdinfo;
    Student[] public arr;
    Student public _localvar;
    
    function registration(uint _rollno, string memory _name, uint _age, uint _registrationDate, Department _department, Status _status, uint _obtainedMarks) public {
        if (_status == Status.NotEnrolled || _status == Status.Expelled) {
            _obtainedMarks = 0;
        }
        Student storage localVar = _localvar;
        localVar.name = _name;
        localVar.age = _age;
        localVar.registrationDate = _registrationDate;
        localVar.department = _department;
        localVar.status = _status;
        localVar.obtainedMarks = _obtainedMarks;
        arr.push(localVar);
        stdinfo[_rollno] = Student(_name, _age, _registrationDate, _department, _status, _obtainedMarks);
    }
    function update(uint _rollno, string memory _name, uint _age, Department _department, Status _status) public {
        Student storage localVar = stdinfo[_rollno];
        localVar.name = _name;
        localVar.age = _age;
        localVar.department = _department;
        localVar.status = _status;
        arr.push(localVar);
    }
    function retrieve(uint _rollno) public view returns (string memory _name, uint _age, uint _registrationDate, Department _department, Status _status, uint _obtainedMarks) {
        Student storage std = stdinfo[_rollno];
        return (std.name, std.age, std.registrationDate, std.department, std.status, std.obtainedMarks);
    }

    uint public dept1;
    uint public dept2;
    uint public dept3;
    uint public dept4;
    
    function dept(Department _dept) public returns (uint deptm) {
        for (uint i = 0; i < arr.length; i++) {
            if (_dept == Department.Artificial_Intelligence) {
                dept1++;
            } else if (_dept == Department.Blockchain) {
                dept2++;
            } else if (_dept == Department.E_Commerce) {
                dept3++;
            } else {
                dept4++;
            }
        }
        return uint(_dept);
    }
    function getTopThreeBlockchainAchievers() public view returns (Student[3] memory) {
        Student[3] memory topAchievers;
        uint highestMark = 0;
        uint secondHighestMark = 0;
        uint thirdHighestMark = 0;
        for (uint i = 0; i < arr.length; i++) {
            if (arr[i].department == Department.Blockchain) {
                uint currentMark = arr[i].obtainedMarks;
                if (currentMark > highestMark) {
                    thirdHighestMark = secondHighestMark;
                    secondHighestMark = highestMark;
                    highestMark = currentMark;

                    topAchievers[2] = topAchievers[1];
                    topAchievers[1] = topAchievers[0];
                    topAchievers[0] = arr[i];
                } else if (currentMark > secondHighestMark) {
                    thirdHighestMark = secondHighestMark;
                    secondHighestMark = currentMark;

                    topAchievers[2] = topAchievers[1];
                    topAchievers[1] = arr[i];
                } else if (currentMark > thirdHighestMark) {
                    thirdHighestMark = currentMark;
                    topAchievers[2] = arr[i];
                }
            }
        }
        return topAchievers;
    }
}
