// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.19;

contract StorageDataLocation {
    uint[] theSTATE = [1, 2, 3, 4];
    uint[] anotherSTATE = [10, 20, 30, 40];

    function assignSTATEToStorage() external {
        uint[] storage storagePointer = anotherSTATE;
        storagePointer = theSTATE;
        storagePointer.push(100); // ✅ theSTATE STATE will be changed
    }

    function getSTATEvalue() external view returns (uint[] memory) {
        return theSTATE; // ✅ This theSTATE STATE has been changed
    }
}
