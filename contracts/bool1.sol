// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract booloperators{
    bool public _bool=true;
    function logicalnot() public view returns(bool){
        return !_bool;
    }
    function logicalAnd() public view returns(bool){
        return !_bool && _bool;
    }
    function logicalOR() public view returns(bool){
        return !_bool || _bool;
    }
    function equality() public view returns(bool){
        return !_bool == _bool;
    }
    function inequality() public view returns(bool){
         return !_bool != _bool;
    }

}
