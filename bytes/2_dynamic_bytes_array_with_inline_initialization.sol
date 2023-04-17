// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.19;

contract StorageDataLocation {
    bytes[] public myName = [bytes("Anis"), bytes(" is")];

    function setMyname() public {
        myName.push(bytes(" a good boy"));
    }

    function getMyname() public view returns (bytes[] memory) {
        return myName;
    }

    function updateElement() public {
        myName[0][0] = "H";
    }
}
