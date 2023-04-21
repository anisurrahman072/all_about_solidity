// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.19;

contract StorageDataLocation {
    uint[] theSTATE = [1, 2, 3, 4];
    uint[] anotherSTATE = [10, 20, 30, 40];

    function assignSTATEToStorage() external returns (uint[] memory) {
        uint[] storage storagePointer = anotherSTATE;
        storagePointer = theSTATE;
        storagePointer.push(100); // ✅ theSTATE STATE will be changed
        return theSTATE;
    }

    function checkAnotherSTATE() external view returns (uint[] memory) {
        return anotherSTATE; // ❌ but anotherSTATE value will not be changed as Ponter was removed from anotherSTATE
    }
}
