// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.19;

contract StorageDataLocation {
    function assignSTATEToStorage(
        uint[] calldata myAges,
        uint[] calldata anotherAges
    ) external pure returns (uint[] memory) {
        myAges = anotherAges; // ✅ calldata myAges value will be changed
        return myAges;
    }
}
