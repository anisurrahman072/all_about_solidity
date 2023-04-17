// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.19;

contract StorageDataLocation {
    uint[] x;

    function setMemory(uint[] memory memoryArray) public {
        x = memoryArray; // ✅ STATE x will be changed
    }

    function getTheValue() public view returns (uint[] memory) {
        return x;
    }
}
