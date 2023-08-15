//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
// contract Events{
//  enum Quality{
//    Good,
//    Moderate,
//    Bad
//  }

//  struct specs{
//    string microprocessor;
//    uint RAM;
//  }
//  event multiple(string laptop, uint indexed price, Quality indexed q,specs indexed s);
//  event newevent(Quality quality,specs spec,uint ROM);
//  event mu(string, Quality);
//  event empty();


//  function emits()public{
//     emit newevent (Quality.Good,specs("cpu",544),33);
//     emit multiple("dell", 100000, Quality.Good, specs("intel", 128));
//     emit mu("Lenovo", Quality.Moderate);
//     emit empty();
//  }
// }
// contract Eventss{
//     address public owner;
//     constructor (){
//         owner = msg.sender;
//     }
//     event event1(address prevowner , address newowner);
//     function NewOwner(address _owner) public {
//         address prevowner= owner;
//         owner = _owner;
//         emit event1(prevowner,owner);
//     }
// }
contract Events2{
    struct PersonInfo{
        string name;
        uint age;
        string department;
    }
    PersonInfo public p1;
    event Update(PersonInfo oldValue,PersonInfo newValue,uint timestamp,uint blockNumber);
    function set(string memory _name, uint _age, string memory _dept) public{
        PersonInfo memory oldValue = p1;
        p1.name = _name;
        p1.age = _age;
        p1.department = _dept;
        emit Update(oldValue, p1, block.timestamp, block.number);

    }
}
contract event2{
    event localvar(string message,int number);
    function numgive(int num) public  returns(int){
        int neg;
        int positiveEven;
        int positiveOdd;
        if(num < 0){
        num = neg;
        emit localvar("Negative number",num);
         return num;
        }
        else if(num%2 == 0){
        num = positiveEven;
        emit localvar("positive even number",num);
        return num;
        }
        else{
            num = positiveOdd;
        emit localvar("positive odd number",num);
        return num;
        }
    }
}
// contract Event {
//  event Log(address indexed sender, string msg);
//  event AnotherLog();
//  function test() public {
//  emit Log(msg.sender, "Hello Web3.0");
//  emit Log(msg.sender, "It's all about Decentralization");
//  emit AnotherLog();
//  }
// }