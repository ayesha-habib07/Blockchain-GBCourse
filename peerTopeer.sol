// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
import "./safeMath.sol";
import "./credit.sol";
contract peerToPeerLending is ownable{
    using safeMath for uint;
    struct User{
        bool credited;
        address activeCredit;
        bool fraudulent;
        address[] allCredits;        
    }
    mapping(address => User) public users;
    address[] public credits;
    event LogCreditCreated(address indexed _address , address indexed  borrower, uint timestamp);
    event LogCreditStateChanged(address indexed _address, credit.States indexed states , uint indexed timestamp);
    event LogCreditActiveChanged(address indexed _address , bool indexed active , uint indexed timestamp);
    event LogUserSetFraud(address indexed _address ,bool fraudStatus ,uint timestamp);

    function applyForCredit(uint _requestedAmount , uint _repaymentCounts,uint _interest , string memory  _description) public returns(address _credits){

        require(users[msg.sender].credited != true , "The user should not have been credited.");
        require(users[msg.sender].fraudulent != true ,"The user should not be marked as fraudulent.");
    
        assert(users[msg.sender].activeCredit == address(0));
        users[msg.sender].credited == true;

        credit newcredit = new credit(_requestedAmount ,_repaymentCounts, _interest, _description);
        users[msg.sender].activeCredit = address(newcredit);
        credits.push(address(newcredit));
        users[msg.sender].allCredits.push(address(newcredit));
        emit LogCreditCreated(address (newcredit), msg.sender, block.timestamp);
        return address(newcredit);
    }
    function getcredits()public  view returns(address[] memory){
        return credits;
    }
    function getUserCredits()public view returns(address[] memory){
        return  users[msg.sender].allCredits;
    }

    function setFraudStatus(address _borrower)external returns(bool){
        users[_borrower].fraudulent = true;
        emit LogUserSetFraud(_borrower, users[_borrower].fraudulent, block.timestamp);
        return users[_borrower].fraudulent;
    }
    function changeCreditState(credit _credit, credit.States states) public onlyOwner{
        credit  newcredit = credit(_credit);
        newcredit.changeState(states);
        emit LogCreditStateChanged(address(newcredit), states, block.timestamp);
    }
    function changeCreditActiveState(credit _credit) public onlyOwner{
        credit newcredit = credit (_credit);
        bool active = newcredit.toggleActive();
        emit  LogCreditActiveChanged(address(newcredit), active, block.timestamp);
    }
}