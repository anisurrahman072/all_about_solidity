// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.19;

contract StorageDataLocation {
    function assignSTATEToStorage(
        uint[] calldata calldataArray
    ) external pure returns (uint[] memory) {
        // calldataArray = new uint[](4); // ❌ ERROR: Type uint256[] memory is not implicitly convertible to expected type uint256[] calldata.
    }
}
