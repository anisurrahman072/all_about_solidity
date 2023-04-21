// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.19;

contract StorageDataLocation {
    uint[] myStateArray = [1, 2, 3, 4];

    function assignSTATEToStorage() external view returns (uint[] memory) {
        uint[] memory storagePointer = myStateArray;
        uint[] memory memoryPointer = new uint[](5);

        memoryPointer = storagePointer; // Assigning Storage reference into memory reference

        memoryPointer[0] = 100;
        memoryPointer[1] = 500;
        return storagePointer; // ✅ storagePointer ARRAY will be changed
    }
}
