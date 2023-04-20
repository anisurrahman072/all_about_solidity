// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.19;

contract StorageDataLocation {
    function assignSTATEToStorage() external pure returns (uint[] memory) {
        uint[] memory memoryPointer = new uint[](4); // keyword new creates a memory ARRAY.
        memoryPointer[1] = 100; // ✅ The value of memoryPointer Array will be changed
        return memoryPointer;
    }
}
