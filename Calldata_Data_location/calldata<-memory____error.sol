// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.19;

contract StorageDataLocation {
    function assignSTATEToStorage() external pure returns (uint[] memory) {
        // uint[] calldata calldataArray = new uint[](4); // ❌ ERROR: Type uint256[] memory is not implicitly convertible to expected type uint256[] calldata.
    }
}
