// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.19;

contract StorageDataLocation {
    function assignSTATEToStorage() external pure returns (uint[] memory) {
        uint[] memory firstMemoryPointer = new uint[](5);
        uint[] memory secondMemoryPointer = new uint[](5);

        firstMemoryPointer = secondMemoryPointer;
        firstMemoryPointer[3] = 100; // ✅ secondMemoryPointer Array will also be changed
        return secondMemoryPointer;
    }
}
