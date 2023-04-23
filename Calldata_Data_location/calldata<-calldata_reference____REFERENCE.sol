// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.19;

contract StorageDataLocation {
    function assignSTATEToStorage(
        uint[] calldata myAges
    ) external pure returns (uint[] memory) {
        uint[] calldata calldataArray = myAges; // ✅ will create a REFERENCE
        // calldataArray[0] = 100; // ❌ ERROR: Calldata arrays are read-only.
        // myAges[0] = 100; // ❌ ERROR: Calldata arrays are read-only.
    }
}
