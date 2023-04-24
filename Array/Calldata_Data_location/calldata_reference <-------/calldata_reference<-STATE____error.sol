// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.19;

contract StorageDataLocation {
    uint[] myState = [1, 2, 3, 4];

    function assignSTATEToStorage(
        uint[] calldata calldataReference
    ) external returns (uint[] memory) {
        // calldataReference = myState; // ❌ ERROR: Type uint256[] storage ref is not implicitly convertible to expected type uint256[] calldata.
    }
}
