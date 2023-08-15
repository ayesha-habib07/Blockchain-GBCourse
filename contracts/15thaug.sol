// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

//  contract  InputValidator{
//     mapping(address=>uint)  public  balances;
//     function balance() public{
//         balances[msg.sender] = 10000;
//     }
//      function  Transfer(uint256 amount, address recipient) public {
//          require(amount > 0 && amount < 100 , 'Amount should be less than 100');
//           balances[msg.sender] -= amount;
//           balances[recipient] += amount; /// balance[recipient]=balance[recipient]+amount;
//      }
//  }

//  contract QuotientCalculator{
//      function calculateQuotient(uint numerator,uint denomenator)public pure returns(uint){
//          require(denomenator != 0 ,'Denomirator cannot be zero');
//          return numerator/denomenator;
//      }
//  }

// revert
//  contract QuotientCalculator1{
//      function calculateQuotient(uint numerator , uint denomirator) public pure returns(uint){
//          if(denomirator != 0){
//            return   numerator/denomirator;
//          }
//            revert('Denomirator cannot be zero');
//      }
//  }

//  contract Assert{
// function subtract(uint num1, uint num2) public pure returns(uint){
// uint sub;
// sub = num1 - num2;
//  assert(int(num1)-int(num2) >= 0);
// return sub;
// }
// }

// contract Darray{
//     int[] public arr;
//     function add(int num) public{
//         arr.push(num);
//     }
//     function pop() public{
//         assert(arr.length > 0);
//         arr.pop();
//     }
// }
// contract universityAdmissionSystem{
//     enum Department{
//         Civil,
//         Mechanic,
//         Electrical,
//         Software
//     }
//     mapping (uint=> bool)public admissionStatus;
//     mapping (uint => Department) public chosenDepartment;
//     function setAdmissionStatus(uint studentID , bool hasPassed) public {
//         admissionStatus[studentID] = hasPassed;
//     }
//     function chooseDepartment(uint studentID , Department dept) public{
//         assert( admissionStatus[studentID] == true);
//         chosenDepartment[studentID] = dept;
//     }
// }

// contract CustomError {
//     uint256[] public arr;
//     error Errormsg(string , uint);
//     function upush(uint256 num) public {
//         if (IsPrime(num)) {
//             //Insert Revert Statement Here
//             revert Errormsg("number is not prime" , num);
//         }
//         arr.push(num);
//     }

//     function IsPrime(uint256 num) public pure returns (bool) {
//         if (num == 0 || num == 1) {
//             return false;
//         }
//         for (uint256 i = 2; i <= num / 2; i++) {
//             if (num % i == 0) {
//                 return true;
//             }
//         }
//         return false;
//     }
// }

//   contract DriverLicense{
//       error TooYoung(string message, uint requiredAge);
//       function Driver(uint age) public pure returns (uint){
//               uint DriverId = 3;
//           if(age>= 18){
//             return DriverId;
//           }
//           else{
//               revert TooYoung('Age is less than 18.', age);
//           }
//       }
//   }
contract ATM{
    uint public CashAvailable;
    error InsufficientFunds(string message , uint currentCash);
    function MoneyWithdraw(uint WithdrawAmount)public {
        if(CashAvailable < WithdrawAmount){
            revert InsufficientFunds('Cash Available  is less than Cash With draw.', CashAvailable);
        }
        else{
            CashAvailable  = CashAvailable - WithdrawAmount;
        }

    }
    function ATMRefill(uint RefillAmount) public {
        CashAvailable = CashAvailable + RefillAmount;
    }
}