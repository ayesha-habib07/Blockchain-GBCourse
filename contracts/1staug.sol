// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Enum {
    enum Exam {
        Checking,
        Pass,
        Fail,
        Scholarship
    }
    Exam public e1;
    Exam e2 = Exam.Fail;
    Exam public e3 = Exam(1);
    Exam public e4;

    function set(Exam _e) public {
        e4 = _e;
    }

    function get() public view returns (Exam) {
        return e4;
    }

    function udelete() public {
        delete e2;
    }

    Exam public e1function;

    function Pass() public {
        if (e1 == Exam.Checking) {
            e1 = Exam.Pass;
            //e1 = Exam(2); can also be used
        }
    }

    // function fail() public {
    //     if(e1 == Exam.Checking){
    //         e1 = Exam.Fail;
    //     }
    // }
    function scholarship() public {
        e1 = Exam(3);
    }

    function idelete() public {
        delete e1;
    }
}
contract PizzaDeli{
    enum PizzaOrder{
        Pending,
        Preparing,
        Delivering,
         Received
    }
    PizzaOrder public p1;
    PizzaOrder public p2 = PizzaOrder.Preparing;
     //p2 = PizzaOrder.pending;
    PizzaOrder public p3 = PizzaOrder(3);
    function setp1(PizzaOrder _val) public {
        p1 = _val;
    }
    function getp1() public view  returns(PizzaOrder) {
        return p1;
    }
    function getter() public view returns(PizzaOrder,PizzaOrder,PizzaOrder){
        return (p1,p2,p3);
    }
}

//  struct Voter {
//  string Name;
//  address addr;
//  bool hasVoted;
//  }
// contract VotingSystem {
//  // An array of 'Voter' structs
//  Voter[] public voters;

//  function create1(string memory _Name, address _addr)
// public {
//  voters.push(Voter(_Name, _addr, false));
//  }
// function create2(string memory _Name, address _addr) public {
//  voters.push(Voter({Name: _Name, addr:_addr, hasVoted:
// false}));
//  }
//  function create3(string memory _Name, address _addr)
// public {
//  Voter memory voter;
//  voter.Name = _Name;
//  voter.addr = _addr;
//  // Voter.hasVoted initialized to false
//  voters.push(voter);
//  } function get(uint _index) public view returns (string
// memory Name, address addr, bool hasVoted) {
//  Voter storage voter = voters[_index];
//  return (voter.Name, voter.addr,voter.hasVoted);
//  }
//  // update hasVoted
//  function togglehasVoted(uint _index) public {
//  Voter storage voter = voters[_index];
//  voter.hasVoted = !voter.hasVoted;
//  }
// }
struct BankAccount {
    uint256 accountID;
    uint256 balance;
    address owner;
}

contract Account {
    BankAccount[] public bAccount;

    function create1(
        uint256 _accountId,
        uint256 _balance,
        address _owner
    ) public {
        bAccount.push(BankAccount(_accountId, _balance, _owner));
    }

    function create2(
        uint256 _accountId,
        uint256 _balance,
        address _owner
    ) public {
        bAccount.push(
            BankAccount({
                accountID: _accountId,
                balance: _balance,
                owner: _owner
            })
        );
    }

    function create3(
        uint256 _accountId,
        uint256 _balance,
        address _owner
    ) public {
        BankAccount memory newVar;
        newVar.accountID = _accountId;
        newVar.balance = _balance;
        newVar.owner = _owner;
        bAccount.push(newVar);
    }

    function getting(uint256 index)
        public
        view
        returns (
            uint256 accountID,
            uint256 balance,
            address owner
        )
    {
        BankAccount storage newVar = bAccount[index];
        return (newVar.accountID, newVar.balance, newVar.owner);
    }
}
