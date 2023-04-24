// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.19;

contract StorageDataLocation {
    function assignSTATEToStorage() external pure returns (uint[] memory) {
        uint[] memory memoryPointer = new uint[](4); // keyword new creates a memory ARRAY. So
        memoryPointer = new uint[](10); // new keyword creates a memory Array.
        return memoryPointer; // memoryPointer Array will be changed & value is now [0,0,0,0,0,0,0,0,0,0]
    }
}
