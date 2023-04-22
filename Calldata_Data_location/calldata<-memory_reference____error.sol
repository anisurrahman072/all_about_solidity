// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.19;

contract StorageDataLocation {
    function assignSTATEToStorage() external pure returns (uint[] memory) {
        uint[] memory memoryPointer = new uint[](4);
        // uint[] calldata calldataArray = memoryPointer; // ❌ ERROR: Type uint256[] memory is not implicitly convertible to expected type uint256[] calldata.
    }
}
