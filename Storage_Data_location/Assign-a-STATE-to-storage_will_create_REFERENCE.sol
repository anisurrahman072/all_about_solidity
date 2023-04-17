// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.19;

contract StorageDataLocation {
    uint[] myAges = [1, 2, 3, 4];

    function getMyAges() external view returns (uint[] memory) {
        return myAges;
    }

    function updateMyAnoAges() external {
        uint[] storage myAnoAges = myAges;
        myAnoAges[0] = 100;
        myAnoAges[1] = 200;
        myAnoAges[2] = 300;
        // The myAges STATE will also be changed too
    }
}
