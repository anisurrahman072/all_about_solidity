// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.19;

contract StorageDataLocation {
    function assignSTATEToStorage() external view returns (uint[] memory) {
        // uint[] storage storagePointer = new uint[](5); // ❌ ERROR: Type uint256[] memory is not implicitly convertible to expected type uint256[] storage pointer.
    }
}
