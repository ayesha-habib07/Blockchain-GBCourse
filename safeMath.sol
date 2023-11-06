// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
library safeMath{
    function multiplication(uint num1 , uint num2) internal pure returns(uint result){
        if(num1 == 0){
            return  0;
        }
         result = num1 * num2;
          assert(result /num1 == num2);
         return result;
    }
    function division(uint num1 , uint num2) internal  pure returns(uint result){
        require(num2 != 0, "Divisor should not zero.");
         result = num1 / num2;
    }
    function subtraction(uint num1 ,uint num2) internal pure returns (uint result){
        assert(num2 <= num1);
        return result= num1 - num2;
    }
    function addition(uint num1 , uint num2) internal pure returns(uint result){
         result = num1 + num2;
         assert(result >= num1);
         return result;
    }
}