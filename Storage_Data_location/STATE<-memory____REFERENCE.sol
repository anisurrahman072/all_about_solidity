// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.19;

contract StorageDataLocation {
    uint[] myState = [1, 2, 3, 4];

    function assignSTATEToStorage() external returns (uint[] memory) {
        myState = new uint[](4); // STATE myState will be changed
        return myState;
    }
}
