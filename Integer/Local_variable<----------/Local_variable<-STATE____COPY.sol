// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.19;

contract uintCopyOrReferenceCheck {
    uint myState = 100;

    function assignUintToAnother() external view returns (uint) {
        uint storageVariable = myState; // ❌ STATE myState will not be changed
        storageVariable = 500;
        return myState;
    }
}
