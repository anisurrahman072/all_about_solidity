// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.19;

contract StorageDataLocation {
    uint[] myState = [1, 2, 3, 4];

    function assignSTATEToStorage() external view returns (uint[] memory) {
        uint[] storage storagePointer = myState;
        uint[] memory memoryPointer = new uint[](5);
        // storagePointer = memoryPointer; // ❌ ERROR: Type uint256[] memory is not implicitly convertible to expected type uint256[] storage pointer.
    }
}
