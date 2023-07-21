// SPDX-License-Identifier: MITfunc
pragma solidity ^0.8.17;
contract byteDatatypes{
    function getBool(bool isEmployee) public view returns (bool){
        bool hasbalance = true;
        bool getpaid = isEmployee || hasbalance;
        return getpaid;
    }
}