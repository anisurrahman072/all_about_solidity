// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.19;

contract uintCopyOrReferenceCheck {
    uint myState = 100;

    function assignUintToAnother() external view returns (uint) {
        uint storageVariable = myState; // ❌ STATE myState will not be changed.
        // 👆 Another point is, local variable storageVariable stays in STACK, not in storage/ memory data location.
        storageVariable = 500;
        return myState;
    }
}
