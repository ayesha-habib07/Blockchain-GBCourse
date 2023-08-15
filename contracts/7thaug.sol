//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// contract Mapper{
//     mapping (address=>string)public AddrToName;
// }
// contract Mappers{
//     mapping(string => uint) public  NameToBalance;
//     function set(string memory str , uint num) public {
//         NameToBalance[str] = num;
//     }
//     function get(string memory str) public view  returns(uint){
//        return NameToBalance[str];
//     } 
//     function reset(string memory str) public {
//         delete  NameToBalance[str];
//     }
// }


// contract Mappings{
//  mapping(address => mapping(string => mapping(string=>uint))) public AddrWalletToName;
//  function AddValue(address _addr, string memory _walletname, string memory _name,uint _balance) public{
//  AddrWalletToName[_addr][_walletname][_name] = _balance;
//  }
//  function get(address _addr, string memory _walletname,string memory _name) public view returns(uint){
//  return AddrWalletToName[_addr][_walletname][_name];
//  }
//  function remove(address _addr, string memory _walletname,string memory _name) public{
//  delete AddrWalletToName[_addr][_walletname][_name];
//  }
// }
// contract NameMap{
//     mapping(uint=>mapping(address=>string)) public UserMap;
//     function  setMap(uint num , address adr , string memory str)public{
//          UserMap[num][adr] =str;
//     }
//     function getMap(uint num,address adr) public view returns(string memory){
//         return UserMap[num][adr];
//     }
//     function reset(uint num , address adr) public{
//         delete UserMap[num][adr];
//     }
// }

// contract StorageDLoc {
//  uint[] arr = [1,2,3]; // state variable
//  function fStorage() public view{
//  // Declare a local storage variable xStorage
//  uint[] memory xStorage = arr;
//  xStorage[0] = 100;
//  }
//  function get() public view returns (uint[] memory){
//  return arr;
//  }
// }

// contract MemoryAssignment {

//  function modifyMemory(uint[] memory originalArray) public pure returns (uint[] memory) {
//  // Assign the input array to a new variable in memory
//  uint[] memory newArray = originalArray;
//  // Modify a value within the new array
//  if (newArray.length > 0) {
//  newArray[0] = 999;
//  }
//  return originalArray; // Return the original array
//  }
// }

// contract calldataDloc {
//  function fCalldata(uint[] calldata _x) public pure returns(uint[] calldata){
//  // _x[0] = 0;
//  return(_x);
//  }
// }
contract task{
    struct CAR{
      string  Make; 
       string model;
       uint Variant;
    }
    CAR public _car;
    CAR[] public arr;
    function initCar1(string memory _make, string memory  _model , uint variant)public  {
        CAR storage car = _car;
        car.Make = _make;
        car.model = _model;
        car.Variant = variant;
        arr.push(car);
    }
    function  initCar2(string memory _make, string memory  _model , uint variant) public {
        CAR memory car;
        car.Make =_make;
        car.model = _model;
        car.Variant  = variant;
        arr.push(car);
    }
}


