// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract IntegerChecker{
    function checkNumber(int num) public pure returns(string memory){
        if(num < 0){
            return  "Number is less than zero.";
        }
        else  if(num > 0){
            return "Number is greater than zero.";
        }
        else{
            return "Number is greater than zero.";
        }
    }
    function checkNum(int num) public pure returns (string memory){
        return (num < 0) ? "Number is less than zero." : (num > 0) ? "Number is greater than zero." : "Number is greater than zero.";
    }


    function StudentScore(uint score)public pure returns(bool, string memory){
        if(score >= 60){
            if(score >= 80 && score <= 100){
                return (true,"Archieved Grade : A");
            }
            if(score >= 60 && score <= 79){
                return (true,"Archieved Grade : B");
            }
        }
        if(score < 60){
            if(score >= 40 && score <=59){
                return  (false,"Archieved Grade : C");
            }
            else if(score >=0 && score <= 39){
                return (false,"Better Luck Next Time.");
            }
        
        }

    }
   
    function stdScore(uint score) public pure returns(bool,string memory){
       return
            (score >= 60) ? (true ,((score >= 80 && score <= 100) ? "Archieved Grade : A" :"Archieved Grade : B") ):
         ((false, (score >= 40 && score <=59) ? "Archieved Grade : C" : "Better Luck Next Time.")) ;
   
    }
}