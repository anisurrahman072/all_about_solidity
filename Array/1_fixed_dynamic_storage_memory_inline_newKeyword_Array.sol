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
    function checkMemoryOrStorageArrayWhenCanBeAssignedByInlineOrNew() public {
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

        // ----------- 🔥🔥 Initialized by STATE array 🔥🔥 ----
        uint[] memory myAges3 = ages2;
        myAges3[0] = 100; //    ✅
        // myAges3.push(100); //❌  ERROR: Member "push" is not available in uint256[] memory outside of storage.

        /**
        

         */
        // 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉  STORAGE  Array  👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈
        // ----------- 🔥🔥 new keyword 🔥🔥 -----------
        // uint[] storage myAges4 = new uint[](4);     // ❌    ERROR: Type uint256[] memory is not implicitly convertible to expected type uint256[] storage pointer.

        // ----------- 🔥🔥 Inline 🔥🔥 ----------------
        // uint[] storage myAges5 = [uint(1),2, 3, 4]; // ❌    ERROR: Type uint256[4] memory is not implicitly convertible to expected type uint256[] storage pointer.

        // ----------- 🔥🔥 Not Initialized 🔥🔥 --------
        uint[] storage myAges6;
        // myAges6[0] = 100;  // ❌   ERROR: This variable is of storage pointer type and can be accessed without prior assignment, which would lead to undefined behaviour.
        // myAges6[10] = 100; // ❌   ERROR: This variable is of storage pointer type and can be accessed without prior assignment, which would lead to undefined behaviour.
        // myAges6.push(1);   // ❌   ERROR: This variable is of storage pointer type and can be accessed without prior assignment, which would lead to undefined behaviour.

        // ----------- 🔥🔥 Initialized by STATE array 🔥🔥 ----
        uint[] storage myAges7 = ages2;
        myAges7[0] = 100; //    ✅
        myAges7.push(100); //   ✅

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

        // ----------- 🔥🔥 Initialized by STATE array 🔥🔥 ----
        uint[2] storage myAnoAges4 = ages;
        myAnoAges4[0] = 100; //     ✅
        // myAnoAges4.push(100); // ❌ ERROR: Member "push" not found or not visible after argument-dependent lookup in uint256[2] storage pointer.

        /**
        

         */
        // 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉  STORAGE  Array  👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈
        // ----------- 🔥🔥 new keyword 🔥🔥 -----------
        // uint[4] storage myAnoAges5 = new uint[](4);     // ❌    ERROR: Type uint256[] memory is not implicitly convertible to expected type uint256[4] storage pointer.

        // ----------- 🔥🔥 Inline 🔥🔥 ----------------
        // uint[4] storage myAnoAges6 = [uint(1),2, 3, 4]; // ❌    ERROR: Type uint256[4] memory is not implicitly convertible to expected type uint256[4] storage pointer.

        // ----------- 🔥🔥 Not Initialized 🔥🔥 --------
        uint[4] storage myAnoAges7;
        // myAnoAges7[0] = 100;  // ❌   ERROR: This variable is of storage pointer type and can be accessed without prior assignment, which would lead to undefined behaviour.
        // myAnoAges7[10] = 100; // ❌   ERROR: Out of bounds array access.
        // myAnoAges7.push(1);   // ❌   ERROR: Member "push" not found or not visible after argument-dependent lookup in uint256[4] storage pointer.

        // ----------- 🔥🔥 Initialized by STATE array 🔥🔥 ----
        uint[2] storage myAnoAges8 = ages;
        myAnoAges8[0] = 100; //     ✅
        // myAnoAges8.push(100); // ❌    ERROR: Member "push" not found or not visible after argument-dependent lookup in uint256[2] storage pointer.
    }

    /**
     
     




     
     
     */
    // --------------------------- Assign Array To Array --------------------
    function assignArrayToArray() public {
        // ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️  Check for DYNAMIC Array  ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️
        // 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉  STORAGE & STATE  Array 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈
        // storage <------------------- storage ============== ❌ Impossible, in technically. As, we can't keep a storage in Right Hand Side of an Equal Operator (=) because as soon as we declare a storage it creates a Storage Reference.
        // storage <------------------- storage reference ==== ✅ 👨‍💻 will create REFERENCE
        // storage reference <--------- storage ============== ❌ Impossible, in technically. As, we can't keep a storage in Right Hand Side of an Equal Operator (=) because as soon as we declare a storage it creates a Storage Reference.
        // storage reference <--------- storage reference ==== ✅ 👨‍💻 will create REFERENCE
        // STATE <------------------- STATE ================== ✅ 👨‍💻 will create COPY
        // storage <----------------- STATE ================== ✅ 👨‍💻 will create REFERENCE
        // storage reference <------- STATE ================== ✅ 👨‍💻 will create REFERENCE
        // STATE <------------------- storage ================ ❌ Impossible, in technically. As, we can't keep a storage in Right Hand Side of an Equal Operator (=) because as soon as we declare a storage it creates a Storage Reference.
        // STATE <------------------- storage reference ====== ✅ 👨‍💻 will create REFERENCE
        // 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉  MEMORY, STORAGE, STATE Array 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈
        // memory <-------------------- memory =============== ✅ 👨‍💻 will create REFERENCE
        // memory <-------------------- memory reference ===== ✅ 👨‍💻 will create REFERENCE
        // memory reference <---------- memory =============== ✅ 👨‍💻 will create REFERENCE
        // memory reference <---------- memory reference ===== ✅ 👨‍💻 will create REFERENCE
        // memory <------------------ storage ================ ❌ Impossible, in technically. As, we can't keep a storage in Right Hand Side of an Equal Operator (=) because as soon as we declare a storage it creates a Storage Reference.
        // memory <------------------ storage reference ====== ✅ 👨‍💻 will create COPY
        // memory reference <-------- storage ================ ❌ Impossible, in technically. As, we can't keep a storage in Right Hand Side of an Equal Operator (=) because as soon as we declare a storage it creates a Storage Reference.❌ Impossible, in technically. As, we can't keep a storage in Right Hand Side of an Equal Operator (=) because as soon as we declare a storage it creates a Storage Reference.
        // memory reference <-------- storage reference
        // storage <----------------- memory
        // storage <----------------- memory reference
        // storage reference <------- memory
        // storage reference <------- memory reference
        // STATE <--------------------- memory
        // STATE <--------------------- memory reference
        // memory <-------------------- STATE =============== ✅ 👨‍💻 will create COPY
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
    }
}
