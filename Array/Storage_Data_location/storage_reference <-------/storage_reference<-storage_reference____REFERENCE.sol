// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.19;

contract StorageDataLocation {
    uint[] firstStorage = [1, 2, 3, 4];
    uint[] secondStorage = [10, 20, 30, 40];

    function assignStorageReferenceToStorageReference() external {
        uint[] storage firstStoragePointer = firstStorage;
        uint[] storage secondStoragePointer = secondStorage;
        firstStoragePointer = secondStoragePointer;
        firstStoragePointer.push(100);
        // ✅ Only secondStorage STATE will be changed
    }

    function getFirstSTATE() external view returns (uint[] memory) {
        return firstStorage; // ❌ This has not been changed because firstStoragePointer is now pointing secondStorage STATE array.
    }

    function getSecondSTATE() external view returns (uint[] memory) {
        return secondStorage; // ✅ This has been changed
    }
}
