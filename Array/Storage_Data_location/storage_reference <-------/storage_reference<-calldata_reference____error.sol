// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.19;

contract StorageDataLocation {
    uint[] myState = [1, 2, 3, 4];

    function assignSTATEToStorage(
        uint[] calldata calldataArray
    ) external view returns (uint[] memory) {
        uint[] storage storageReference = myState;
        // storageReference = calldataArray; // ❌ ERROR: Type uint256[] calldata is not implicitly convertible to expected type uint256[] storage pointer.
    }
}
