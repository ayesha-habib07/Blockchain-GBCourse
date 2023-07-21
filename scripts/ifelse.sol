// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract ifelse{
    uint public constant adultFees = 20;
    uint public constant childFees = 0;
    uint public constant CuttOfAge = 10;
    function fee(uint age,bool isGirl) public pure returns(uint,string memory gift){
        if(age < CuttOfAge){
            if(isGirl){
                gift = "Barbie Girl";
            }
            else{
                 gift = "ball";
            }
            return(childFees,gift);
        }
       else {
           return (adultFees , gift);
    
       }
       
    }
      function fee3(uint age,bool isGirl) public pure returns(uint,string memory gift)  {

          return (age < CuttOfAge) ? (childFees,(isGirl)?  "Barbie girl" : "ball") : (adultFees , "no gift"); 
      }
  

}