// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.19;

contract StorageDataLocation {
    uint[] myStateArray = [1, 2, 3, 4];

    function assignSTATEToStorage() external view returns (uint[] memory) {
        uint[] memory memoryArray = myStateArray;
        memoryArray[0] = 100;
        memoryArray[1] = 500;
        return myStateArray; // ❌ myStateArray will not be changed
    }
}
