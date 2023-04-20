// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.19;

contract StorageDataLocation {
    function assignSTATEToStorage() external pure returns (uint[] memory) {
        uint[] memory memoryPointer = new uint[](4); // memoryPointer is a Memory Reference Array.
        uint[] memory anotherMemory = memoryPointer;
        anotherMemory[1] = 100;
        anotherMemory[3] = 100; // ✅ The memoryPointer Array will also be changed
        // anotherMemory[13] = 100; // ❌ ERROR will be occurred for index 13 accessing
        return memoryPointer;
    }
}
