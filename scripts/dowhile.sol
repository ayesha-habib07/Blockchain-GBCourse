// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract quiz{
    uint public count =10;
    uint  public cocaCola = 10;
    int public x = 10;
    uint public sum =0;
    function decrement() public{
        do{
            count--;
        }
        while(count > 0);
    }

    function whileloop(uint buyerdrink) public {
        uint numberOfAvailableDrinks =  cocaCola >= buyerdrink ? buyerdrink :cocaCola;
        while(numberOfAvailableDrinks > 0){
            numberOfAvailableDrinks--;
             cocaCola--;
        }
    }
    function whileloopc() public{
    do{
        x--;
    }
    while(x>0);
    }
    function forloop() public {

    }
    
}
