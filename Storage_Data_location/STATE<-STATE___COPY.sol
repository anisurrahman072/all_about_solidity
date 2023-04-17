// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.19;

contract StorageDataLocation {
    uint[] myAges = [1, 2, 3, 4];
    uint[] myAnoAges = myAges;

    function getMyAges() external view returns (uint[] memory) {
        return myAges;
    }

    function getMyAnoAges() external view returns (uint[] memory) {
        return myAnoAges;
    }

    function updateMyAnoAges() external {
        myAnoAges = [100, 200, 300]; // ❌ This will not update myAges STATE array
    }
}
