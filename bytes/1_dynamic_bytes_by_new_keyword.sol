// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.19;

contract StorageDataLocation {
    bytes public myName;
    bytes public myAnotherName;

    function setMyName() public {
        myName = new bytes(1);
        myName[0] = "A";
        // myName[1] = "n";     // ❌ ERROR: As we declared "new bytes(1)" which means only 1 byte (in Hex it means 2 blank space, 00 as value) is assigned in "myName". After this line of "new bytes(1)" the value of myName will be "0x00" in hex. Then in 2nd line we replaced 00 by the hex value of "A" .
    }

    function setMyNameInDifferentWay() public {
        myAnotherName = new bytes(1);
        myAnotherName.push("A");
        myAnotherName.push("n");
        myAnotherName.push("i");
        myAnotherName.push("s"); // ✅ No ERROR. The output value of "myAnotherName" will be --->  "0x00416e6973"
    }
}
