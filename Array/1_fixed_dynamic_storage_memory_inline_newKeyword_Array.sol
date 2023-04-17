// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.19;

contract StorageDataLocation {
    // ---------------------------------------------- Fixed Size Array ----------------------------------------------------
    uint[2] public ages = [1, 2]; // ✅
    // uint[2] public ages1 = new uint[](2); ❌ // TypeError: Type uint256[] memory is not implicitly convertible to expected type uint256[2] storage ref.

    // ------------------------------------------------- Dynamic Array ----------------------------------------------------
    uint[] public ages2 = [1, 2]; // ✅
    uint[] public ages3 = new uint[](2); // ✅

    /**
     
     
     
     
     */
    // ----------------------------------- Assign Fixed Array into Dynamic memory Array -----------------------------------
    function assignFixedArrayIntoDynamicMemoryArray() public pure {
        // uint[] memory ages = [uint(1),2,3,4]; ❌ // Type uint256[4] memory is not implicitly convertible to expected type uint256[] memory.

        // Create a Fixed Array then assign that Fixed size Array to a Dynamic Memory Array
        uint[4] memory fixedSizeArray = [uint(1), 2, 3, 4];
        // uint[] memory ages = fixedSizeArray; ❌ // Type uint256[4] memory is not implicitly convertible to expected type uint256[] memory
    }

    /**
     
     
     
     
     */
    // --------------------------- Check when Memory/ Storage can be assigned by Inline or new keyword --------------------
    function checkMemoryOrStorageArrayWhenCanBeAssignedByInlineOrNew()
        public
        pure
    {
        // ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️  Check for DYNAMIC Array  ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️
        // 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉  MEMORY  Array 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈
        // ----------- 🔥🔥 new keyword 🔥🔥 -----------
        uint[] memory myAges = new uint[](4); // ✅
        myAges[0] = 100; //    ✅
        myAges[10] = 100; //   ✅
        // myAges.push(10); // ❌    ERROR: Member "push" is not available in uint256[] memory outside of storage. You can assign by ARRAY INDEX.

        // ----------- 🔥🔥 Inline 🔥🔥 ----------------
        // uint[] memory myAges1 = [uint(1),2, 3, 4];  // ❌   ERROR: Type uint256[4] memory is not implicitly convertible to expected type uint256[] memory.

        // ----------- 🔥🔥 Not Initialized 🔥🔥 -------
        uint[] memory myAges2;
        myAges2[0] = 100; //   ✅
        myAges2[10] = 100; //  ✅
        // myAges2.push(1); // ❌    ERROR: Member "push" is not available in uint256[] memory outside of storage. You can assign by ARRAY INDEX.

        /**
        
         */
        // 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉  STORAGE  Array  👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈
        // ----------- 🔥🔥 new keyword 🔥🔥 -----------
        // uint[] storage myAges3 = new uint[](4);     // ❌    ERROR: Type uint256[] memory is not implicitly convertible to expected type uint256[] storage pointer.

        // ----------- 🔥🔥 Inline 🔥🔥 ----------------
        // uint[] storage myAges4 = [uint(1),2, 3, 4]; // ❌    ERROR: Type uint256[4] memory is not implicitly convertible to expected type uint256[] storage pointer.

        // ----------- 🔥🔥 Not Initialized 🔥🔥 --------
        uint[] storage myAges5;
        // myAges5[0] = 100;  // ❌   ERROR: This variable is of storage pointer type and can be accessed without prior assignment, which would lead to undefined behaviour.
        // myAges5[10] = 100; // ❌   ERROR: This variable is of storage pointer type and can be accessed without prior assignment, which would lead to undefined behaviour.
        // myAges5.push(1);   // ❌   ERROR: This variable is of storage pointer type and can be accessed without prior assignment, which would lead to undefined behaviour.

        /**
         

         */
        // ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️  Check for FIXED SIZE ARRAY  ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️
        // 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉  MEMORY  Array  👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈
        // ----------- 🔥🔥 new keyword 🔥🔥 ------------
        // uint[4] memory myAnoAges1 = new uint[](4);   // ❌   ERROR: Type uint256[] memory is not implicitly convertible to expected type uint256[4] memory.

        // ----------- 🔥🔥 Inline 🔥🔥 -----------------
        uint[4] memory myAnoAges2 = [uint(1), 2, 3, 4]; // ✅
        myAnoAges2[0] = 100; // ✅
        // myAnoAges2[10] = 100; // ❌   ERROR: Out of bounds array access.
        // myAnoAges2.push(1);   // ❌   ERROR: Member "push" not found or not visible after argument-dependent lookup in uint256[4] memory.

        // ----------- 🔥🔥 Not Initialized 🔥🔥 --------
        uint[4] memory myAnoAges3;
        myAnoAges3[0] = 100; //     ✅
        // myAnoAges3[10] = 100; // ❌   ERROR: Out of bounds array access.
        // myAnoAges3.push(1);   // ❌   ERROR: Member "push" not found or not visible after argument-dependent lookup in uint256[4] storage pointer.

        /**
        
         */
        // 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉  STORAGE  Array  👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈
        // ----------- 🔥🔥 new keyword 🔥🔥 -----------
        // uint[4] storage myAnoAges4 = new uint[](4);     // ❌    ERROR: Type uint256[] memory is not implicitly convertible to expected type uint256[4] storage pointer.

        // ----------- 🔥🔥 Inline 🔥🔥 ----------------
        // uint[4] storage myAnoAges5 = [uint(1),2, 3, 4]; // ❌    ERROR: Type uint256[4] memory is not implicitly convertible to expected type uint256[4] storage pointer.

        // ----------- 🔥🔥 Not Initialized 🔥🔥 --------
        uint[4] storage myAnoAges6;
        // myAnoAges6[0] = 100;  // ❌   ERROR: This variable is of storage pointer type and can be accessed without prior assignment, which would lead to undefined behaviour.
        // myAnoAges6[10] = 100; // ❌   ERROR: Out of bounds array access.
        // myAnoAges6.push(1);   // ❌   ERROR: Member "push" not found or not visible after argument-dependent lookup in uint256[4] storage pointer.
    }


    /**
     
     
     
     
     */
    // --------------------------- Assign Array To Array --------------------
    function assignArrayToArray() public {
        uint[] memory myAges = new uint[](4);
        uint[] memory myAges2;
        uint[] storage myAges5;
        uint[4] memory myAnoAges2 = [uint(1), 2, 3, 4];
        uint[4] memory myAnoAges3;
        uint[4] storage myAnoAges6;

        // ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️  Check for DYNAMIC Array  ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️
        // 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉  STORAGE & STATE  Array 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈
        // storage <------------------- storage
        // storage <------------------- storage reference
		// storage reference <--------- storage
        // storage reference <--------- storage reference
        // STATE <------------------- STATE
        // storage <----------------- STATE
        // storage reference <------- STATE

        // 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉  MEMORY, STORAGE, STATE Array 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈
        // memory <-------------------- memory
        // memory <-------------------- memory reference
        // memory reference <---------- memory
        // memory reference <---------- memory reference
        // memory <------------------ storage
        // memory <------------------ storage reference
        // memory reference <-------- storage
        // memory reference <-------- storage reference
        // storage <----------------- memory
        // storage <----------------- memory reference
        // storage reference <------- memory
        // storage reference <------- memory reference
        // STATE <--------------------- memory
        // STATE <--------------------- memory reference
        // memory <-------------------- STATE
        // memory reference <---------- STATE

        // 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉  CALLDATA, MEMORY, STORAGE, STATE Array 👈 👈 👈 👈 👈 👈 👈 👈  👈 👈 👈 👈
        // calldata <------------------ calldata
        // calldata <------------------ calldata reference
        // calldata reference <-------- calldata
        // calldata reference <-------- calldata reference
        // memory <------------------ calldata
        // memory <------------------ calldata reference
        // memory reference <-------- calldata
        // memory reference <-------- calldata reference
        // calldata <---------------- memory
        // calldata <---------------- memory reference
        // calldata reference <------ memory
        // calldata reference <------ memory reference
        // storage <-------------------- calldata
        // storage <-------------------- calldata reference
        // storage reference <---------- calldata
        // storage reference <---------- calldata reference
        // calldata <------------------- storage
        // calldata <------------------- storage reference
        // calldata reference <--------- storage
        // calldata reference <--------- storage reference
        // STATE <------------------- calldata
        // STATE <------------------- calldata reference
        // calldata <---------------- STATE
        // calldata reference <------ STATE


        /**
        

         */
        // ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️  Check for FIXED Array  ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️
        // 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉  STORAGE & STATE  Array 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈
        // storage <------------------- storage
        // storage <------------------- storage reference
		// storage reference <--------- storage
        // storage reference <--------- storage reference
        // STATE <------------------- STATE
        // storage <----------------- STATE
        // storage reference <------- STATE

        // 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉  MEMORY, STORAGE, STATE Array 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈
        // memory <-------------------- memory
        // memory <-------------------- memory reference
        // memory reference <---------- memory
        // memory reference <---------- memory reference
        // memory <------------------ storage
        // memory <------------------ storage reference
        // memory reference <-------- storage
        // memory reference <-------- storage reference
        // storage <----------------- memory
        // storage <----------------- memory reference
        // storage reference <------- memory
        // storage reference <------- memory reference
        // STATE <--------------------- memory
        // STATE <--------------------- memory reference
        // memory <-------------------- STATE
        // memory reference <---------- STATE

        // 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉  CALLDATA, MEMORY, STORAGE, STATE Array 👈 👈 👈 👈 👈 👈 👈 👈  👈 👈 👈 👈
        // calldata <------------------ calldata
        // calldata <------------------ calldata reference
        // calldata reference <-------- calldata
        // calldata reference <-------- calldata reference
        // memory <------------------ calldata
        // memory <------------------ calldata reference
        // memory reference <-------- calldata
        // memory reference <-------- calldata reference
        // calldata <---------------- memory
        // calldata <---------------- memory reference
        // calldata reference <------ memory
        // calldata reference <------ memory reference
        // storage <-------------------- calldata
        // storage <-------------------- calldata reference
        // storage reference <---------- calldata
        // storage reference <---------- calldata reference
        // calldata <------------------- storage
        // calldata <------------------- storage reference
        // calldata reference <--------- storage
        // calldata reference <--------- storage reference
        // STATE <------------------- calldata
        // STATE <------------------- calldata reference
        // calldata <---------------- STATE
        // calldata reference <------ STATE



        /**
        

         */
        // ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️  Assign DYNAMIC to FIXED array  ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️



        /**
        

         */
        // ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️  Assign FIXED to DYNAMIC array  ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️
    }
}
