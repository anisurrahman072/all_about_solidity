// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.19;

contract StorageDataLocation {
    function assignSTATEToStorage(
        uint[] calldata myAges
    ) external pure returns (uint[] memory) {
        uint[] memory memoryArray = myAges;
        memoryArray[0] = 100; // ❌ myAges calldata Array will not be changed
        return myAges;
    }
}
