// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.19;

contract StorageDataLocation {
    uint[] myState = [1, 2, 3, 4];

    function assignSTATEToStorage(
        uint[] calldata calldataReference
    ) external returns (uint[] memory) {
        myState = calldataReference; // ✅ STATE myState will be changed
        return myState;
    }
}
