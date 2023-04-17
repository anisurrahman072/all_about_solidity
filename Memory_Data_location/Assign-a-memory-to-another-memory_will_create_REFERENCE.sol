// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.19;

contract StorageDataLocation {
    function updateMyAnoAges() external pure returns (uint[] memory) {
        uint[] memory myAges = new uint[](4);
        uint[] memory myAnoAges = myAges;
        myAnoAges[0] = 100;
        myAnoAges[1] = 200;
        myAnoAges[2] = 300;
        return myAges; // The myAges Array will be changed too.
    }
}
