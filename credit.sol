// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
import './safeMath.sol';
import './ownable.sol';
contract credit is ownable{
    using safeMath for uint;
    address  borrower= tx.origin;
    uint  requestedAmount;
    uint  returnAmount;
    uint  repaidAmount;
    uint  Interest;
    uint requestedRepayments;
    uint remainingRepayments;
    uint repaymentInstallment;
    uint requestedDate;
    uint lastRepaymentDate;
    string description;
    bool active = true;
    uint lendersCount=0;
    uint revokeVotes=0;
    uint revokeTimeNeeded = block.timestamp + 1 seconds;
    uint fraudVotes = 0;
    mapping (address => bool)  public lenders;
    mapping (address => uint) lendersInvestedAmount;
    mapping (address => bool) revokeVoters;
    mapping (address => bool) fraudVoters;
    enum States{
        investment,
        repayment,
        interestReturns,
        expired,
        revoked,
        fraud
    }
    States states;
    event LogCreditInitialized(address indexed _address , uint indexed timestamp);
    event LogCreditStateChanged(States indexed states , uint indexed timestamp);
    event LogCreditStateActiveChanged(bool indexed active , uint indexed timestamp);
    event LogBorrowerWithdrawal(address indexed _address , uint indexed _amount , uint indexed timestamp);
    event LogBorrowerRepaymentInstallment(address indexed _address , uint indexed _amount , uint indexed timestamp);
    event LogBorrowerRepaymentFinished(address indexed _address,uint indexed timestamp);
    event LogBorrowerChangeReturned(address indexed _address , uint indexed _amount , uint indexed timestamp);
    event LogLenderInvestment(address indexed _address , uint indexed _amount , uint indexed timestamp);
    event LogLenderWithdrawal(address indexed _address , uint indexed _amount , uint indexed timestamp);
    event LogLenderChangeReturned(address indexed _address , uint indexed _amount , uint indexed timestamp);
    event LogLenderVoteForRevoking(address indexed _address ,uint indexed timestamp);
    event LogLenderVoteForFraud(address indexed _address ,uint indexed timestamp);
    event LogLenderRefunded(address indexed _address , uint indexed _amount , uint indexed timestamp);

    modifier isActive(){
        active = true;
        _;
    }
    modifier onlyBorrower(){
        require(msg.sender == borrower);
        _;
    }
    modifier onlyLender(){
        require(lenders[msg.sender] == true);
        _;
    }
    modifier canAskForInterest(){
        require(states == States.interestReturns);
        lendersInvestedAmount[msg.sender] > 0;
        _;
    }
    modifier canInvest(){
        require(states == States.investment);
        _;
    }
    modifier canRepay(){
        require(states == States.repayment);
        _;
    }
    modifier canWithdraw(){
        require(address(this).balance > requestedAmount);
        _;
    }
    modifier isNotFraud(){
        require(states != States.fraud);
        _;
    }
    modifier isRevokable(){
        require(block.timestamp >= revokeTimeNeeded);
        _;
    }
    modifier isRevoked(){
        states == States.revoked;
        _;
    }
    constructor(uint _requestedAmount,uint _requestedRepayments , uint _interest, string memory _description){
        requestedAmount = _requestedAmount;
        requestedRepayments = _requestedRepayments;
        Interest = _interest;
        description = _description;

        returnAmount = requestedAmount.addition(Interest);
        repaymentInstallment = returnAmount.division(requestedRepayments);
        requestedDate = block.timestamp;
        emit  LogCreditInitialized(borrower,block.timestamp);
    }

    function getBalance()public view returns(uint){
        return address(this).balance;
    }

    function changeState(States _states)external onlyOwner{
        states = _states;
        emit LogCreditStateChanged(states, block.timestamp);
    }

    function toggleActive() external onlyOwner returns(bool){
        active = !active;
        emit LogCreditStateActiveChanged(active, block.timestamp);
        return active;
    }

    function invest() public canInvest payable{
        uint extraMoney = 0;
        if(address(this).balance >= requestedAmount){
            extraMoney = address(this).balance.subtraction(requestedAmount);
            assert( requestedAmount == address(this).balance.subtraction(extraMoney));
            uint subResultOfBalance = address(this).balance.subtraction(extraMoney);
            assert(subResultOfBalance == requestedAmount);
            assert(extraMoney <= msg.value);
            }

              if(extraMoney > 0){
                payable (msg.sender).transfer(extraMoney);
                emit LogLenderChangeReturned(msg.sender, extraMoney, block.timestamp);

            }
            states  = States.repayment;
            emit LogCreditStateChanged(states , block.timestamp); 
        

        lenders[msg.sender] = true;
        lendersCount++;
        lendersInvestedAmount [msg.sender] = lendersInvestedAmount[msg.sender].addition(msg.value.subtraction(extraMoney));
        emit LogLenderInvestment(msg.sender , msg.value.subtraction(extraMoney) , block.timestamp);
    } 
    function repay()public onlyBorrower canRepay payable{
        require(remainingRepayments > 0 ,"The Borrower can repay if the remaining amount is greater than zero.");
        require(msg.value >= repaymentInstallment ,"The value sent should be greater than the repayment installment.");
        assert (repaidAmount < returnAmount);
        // If this condition fails, it means the credit has already been fully repaid, preventing over-
// repayment. (assert)
        remainingRepayments--;
        lastRepaymentDate = block.timestamp;
        uint extraMoney = 0;
        if(msg.value >repaymentInstallment){
            extraMoney = msg.value.subtraction(repaymentInstallment);
            assert(repaymentInstallment== msg.value.subtraction(extraMoney));
            assert(extraMoney <= msg.value);
            payable (msg.sender).transfer(extraMoney);
        }
         emit LogBorrowerChangeReturned(msg.sender, extraMoney,block.timestamp);
         emit LogBorrowerRepaymentInstallment(msg.sender, msg.value.subtraction(extraMoney), block.timestamp);
            repaidAmount= repaidAmount.addition(msg.value.subtraction(extraMoney));
          if (repaidAmount == returnAmount){
                emit LogBorrowerRepaymentFinished(msg.sender,block.timestamp);
                states = States.interestReturns;
                emit LogCreditStateChanged(states, block.timestamp);
            }
    }
    function withdraw()public isActive onlyBorrower canWithdraw isNotFraud{
        states = States.repayment;
        emit LogCreditStateChanged(states, block.timestamp);
        emit LogBorrowerWithdrawal(msg.sender, address(this).balance, block.timestamp);
        payable (borrower).transfer(address(this).balance);
    }
    function requestInterest ()public isActive onlyLender canAskForInterest{
        uint lenderReturnAmount=lendersInvestedAmount[msg.sender].multiplication(returnAmount.division(lendersCount).division(lendersInvestedAmount[msg.sender]));
        assert(address(this).balance >= lenderReturnAmount);
        payable (msg.sender).transfer(lenderReturnAmount);
        emit LogLenderWithdrawal(msg.sender, lenderReturnAmount, block.timestamp);
        if(address(this).balance == 0){
            active=false;
            emit LogCreditStateActiveChanged(active, block.timestamp);
            states = States.expired;
            emit LogCreditStateChanged(states, block.timestamp);
        }
    }
    function getCreditInfo()public view returns(address ,string memory,uint ,uint,uint,uint,uint,uint,States,bool,uint){
        return(
        borrower,
        description,
        requestedAmount,
         requestedRepayments,
         repaymentInstallment,
         remainingRepayments,
          Interest,
          returnAmount,
          states,
          active,
          address(this).balance
         );
    } 
    function revokeVote()public isActive isRevokable onlyLender{
        require(revokeVoters[msg.sender]== false , "Require Only one vote per Lender.");
        revokeVotes++;
        revokeVoters[msg.sender] == true;
        emit LogLenderVoteForRevoking(msg.sender ,block.timestamp);
        if (lendersCount == revokeVotes){
            revoke();
        }
    }
    function revoke()internal{
        states = States.revoked;
        emit LogCreditStateChanged(states, block.timestamp);
    }
    function refund()public isActive onlyLender isRevokable{
        assert(address(this).balance >= lendersInvestedAmount[msg.sender]);
        if (address(this).balance == 0){
            active = false;
            emit LogCreditStateActiveChanged(active, block.timestamp);
            states = States.expired;
            emit LogCreditStateChanged(states, block.timestamp);
        }
    } 
    function fruadVote()public isActive onlyLender{
        require(fraudVoters[msg.sender] == false);
        fraudVotes++;
        fraudVoters[msg.sender] == true;
        emit LogLenderVoteForFraud(msg.sender, block.timestamp);
    }
}