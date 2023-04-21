// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.19;

contract StorageDataLocation {
    uint[] myState = [1, 2, 3, 4];

    function assignSTATEToStorage() external returns (uint[] memory) {
        uint[] memory memoryPointer = new uint[](4);
        myState = memoryPointer; // ✅ STATE myState will be changed
        return myState;
    }
}
