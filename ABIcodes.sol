// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
// contract ABI{

// function encode(address _address, uint data)public pure returns (bytes memory) {
//     return (abi.encode(_address, data));
// }

// function encodePacked(address _address, uint data) public pure returns(bytes memory result) {
//     result = abi.encodePacked(_address, data);
// }

// function encodeWithSelector(address _address, uint data)public pure returns(bytes memory result) {
// result = abi.encodeWithSelector(bytes4(keccak256("encodeWithSelector(address, uint )")),_address, data);
// }

// function encodeWithSignature(address _address, uint data) public pure returns(bytes memory result) {
// result = abi.encodeWithSignature(("encodeWithSelector(address, uint)"),_address, data);
// }
// }
contract ABI1{
    struct Laptop{
        string brand;
        uint price;
        uint RAM;
        bool isSSD;
    }
    bytes b;
    Laptop[] public LaptopArray;
    function encode(string memory _brand, uint _price,uint _RAM,bool _isSSD)public returns(string[] memory details){
        Laptop memory Laparr;
        Laparr.brand = _brand;
        Laparr.price = _price;
        Laparr.RAM = _RAM;
        Laparr.isSSD= _isSSD;
        LaptopArray.push(Laparr);
        return details;
    }
    function getLaptopEncode(uint i) public  returns (bytes memory details){
        require(LaptopArray.length > i , "InValid Index.");
        b =abi.encode(LaptopArray[i]);
        return b;
    }
    function getLaptopDecode() public view returns (Laptop memory){
        return abi.decode(b , (Laptop));
    }
    
     function encodePacked(string memory _brand, uint _price,uint _RAM,bool _isSSD)public returns(bytes memory details){
        b=abi.encodePacked(_brand,_price, _RAM,_isSSD);
        return b;
    }
    function encodeWithSelector(string memory _brand, uint _price,uint _RAM,bool _isSSD) public pure  returns(bytes memory details){
        return abi.encodeWithSelector(bytes4(keccak256("encode.encodeWithSelector(string, uint, uint, bool)")), _brand, _price, _RAM,_isSSD);
    }

      function encodeWithSignature(string memory _brand, uint _price,uint _RAM,bool _isSSD) public pure  returns(bytes memory details){
        return abi.encodeWithSignature(("encodeWithSelector(address, uint , uint ,bool)"), _brand, _price, _RAM,_isSSD );
    }
}

// // Example3
// contract Decodes{
//     struct votes{
//     address Address;
//     uint ID;
//     string name;
//     uint[3] dateOfBirth;
//     }
//     votes[] public votesArr;
//     function enccoding( address _address,uint256 id,string memory _name,uint[3] memory DOB) public  returns(bytes memory details){
//     votes  memory votesVar;
//     votesVar.Address=_address;
//     votesVar.ID=id;
//     votesVar.name=_name;
//     votesVar.dateOfBirth=DOB;
//     votesArr.push(votesVar);
//     return details;
//     }
//     bytes b;
//       function getEncode(uint i) public  returns (bytes memory details){
//         require(votesArr.length > i , "InValid Index.");
//         b =abi.encode(votesArr[i]);
//         return b;
//     }

//     function getLaptopDecode() public view returns (votes memory){
//         return abi.decode(b , (votes));
//     }
// }