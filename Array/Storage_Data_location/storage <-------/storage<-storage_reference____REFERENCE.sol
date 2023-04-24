// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.19;

contract StorageDataLocation {
    uint[] myAges = [1, 2, 3, 4];

    function assignStorageReferenceToStorage() external {
        uint[] storage storagePointer = myAges; // storagePointer is now storage reference
        uint[] storage storageVariable = storagePointer;
        storageVariable.push(100);
        // ✅ This will update the storage Reference Array storagePointer. Which will change STATE myAges Array.
    }

    function getMyAgesSTATE() external view returns (uint[] memory) {
        return myAges;
    }
}
