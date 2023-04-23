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
        // memory reference <-------- storage ================ ❌ Impossible, in technically. As, we can't keep a storage in Right Hand Side of an Equal Operator (=) because as soon as we declare a storage it creates a Storage Reference.
        // memory reference <-------- storage reference ====== ✅ 👨‍💻 will create REFERENCE
        // storage <----------------- memory ================= ❌ 👨‍💻 ERROR.
        // storage <----------------- memory reference ======= ❌ 👨‍💻 ERROR.
        // storage reference <------- memory ================= ❌ 👨‍💻 ERROR.
        // storage reference <------- memory reference ======= ❌ 👨‍💻 ERROR.
        // STATE <--------------------- memory =============== ✅ 👨‍💻 will create REFERENCE (means STATE value will be changed)
        // STATE <--------------------- memory reference ===== ✅ 👨‍💻 will create REFERENCE (means STATE value will be changed)
        // memory <-------------------- STATE ================ ✅ 👨‍💻 will create COPY
        // memory reference <---------- STATE ================ ✅ 👨‍💻 will create COPY
        // 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉  CALLDATA, MEMORY, STORAGE, STATE Array 👈 👈 👈 👈 👈 👈 👈 👈  👈 👈 👈 👈
        // calldata <------------------ calldata ============= ❌ Impossible, in technically. As, we can't keep a calldata in Right Hand Side of an Equal Operator (=) because as soon as we declare a calldata it creates a calldata Reference. Another big reason is, you can't allocate Arrays & structs as calldata.
        // calldata <------------------ calldata reference === ✅ 👨‍💻 will create COPY or REFERENCE (Not sure yet)
        // calldata reference <-------- calldata ============= ❌ Impossible, in technically. As, we can't keep a calldata in Right Hand Side of an Equal Operator (=) because as soon as we declare a calldata it creates a calldata Reference. Another big reason is, you can't allocate Arrays & structs as calldata.
        // calldata reference <-------- calldata reference === ✅ 👨‍💻 will create REFERENCE
        // memory <------------------ calldata =============== ❌ Impossible, in technically. As, we can't keep a calldata in Right Hand Side of an Equal Operator (=) because as soon as we declare a calldata it creates a calldata Reference.
        // memory <------------------ calldata reference ===== ✅ 👨‍💻 will create COPY
        // memory reference <-------- calldata =============== ❌ Impossible, in technically. As, we can't keep a calldata in Right Hand Side of an Equal Operator (=) because as soon as we declare a calldata it creates a calldata Reference.
        // memory reference <-------- calldata reference ===== ✅ 👨‍💻 will create COPY
        // calldata <---------------- memory ================= ❌ 👨‍💻 ERROR.
        // calldata <---------------- memory reference ======= ❌ 👨‍💻 ERROR.
        // calldata reference <------ memory ================= ❌ 👨‍💻 ERROR.
        // calldata reference <------ memory reference ======= ❌ 👨‍💻 ERROR.
        // storage <-------------------- calldata ============ ❌ Impossible, in technically. As, we can't keep a calldata in Right Hand Side of an Equal Operator (=) because as soon as we declare a calldata it creates a calldata Reference.
        // storage <-------------------- calldata reference == ❌ 👨‍💻 ERROR.
        // storage reference <---------- calldata ============ ❌ Impossible, in technically. As, we can't keep a calldata in Right Hand Side of an Equal Operator (=) because as soon as we declare a calldata it creates a calldata Reference.
        // storage reference <---------- calldata reference == ❌ 👨‍💻 ERROR.
        // calldata <------------------- storage ============= ❌ Impossible, in technically. As, we can't keep a storage in Right Hand Side of an Equal Operator (=) because as soon as we declare a storage it creates a Storage Reference.
        // calldata <------------------- storage reference === ❌ 👨‍💻 ERROR.
        // calldata reference <--------- storage ============= ❌ Impossible, in technically. As, we can't keep a storage in Right Hand Side of an Equal Operator (=) because as soon as we declare a storage it creates a Storage Reference.
        // calldata reference <--------- storage reference === ❌ 👨‍💻 ERROR.
        // STATE <------------------- calldata =============== ❌ Impossible, in technically. As, we can't keep a calldata in Right Hand Side of an Equal Operator (=) because as soon as we declare a calldata it creates a calldata Reference. Another big reason is, you can't allocate Arrays & structs as calldata.
        // STATE <------------------- calldata reference ===== ✅ 👨‍💻 will create REFERENCE
        // calldata <---------------- STATE ================== ❌ 👨‍💻 ERROR.
        // calldata reference <------ STATE ================== ❌ 👨‍💻 ERROR.
        /*



         */
        // What Jean Cavlr said is here from above analysis
        // 1. storage reference <---------------------------- STATE + storage reference
        // 2. memory reference <----------------------------- STATE + storage reference + memory + memory reference + calldata reference
        // 3. calldata reference <--------------------------- calldata reference
        /*



         */
        // Others rules of Assigning (Only what you can do)
        // 1. STATE <--------------------------------------- STATE + storage reference + memory + memory reference + calldata reference
        // 2. storage <------------------------------------- STATE + storage reference
        // 3. memory <-------------------------------------- STATE + storage reference + memory + memory reference + calldata reference
        // 4. calldata <------------------------------------ calldata reference
    }
}
