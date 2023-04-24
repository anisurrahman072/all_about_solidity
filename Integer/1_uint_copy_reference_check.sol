// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.19;

contract StorageDataLocation {
    // ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️  Check for DYNAMIC Array  ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️ ⚪️
    // First of all remember that, you can't specify Data Location for COPY data types like uint
    /**








     */
    // --------------------------- uint To uint --------------------
    function assignArrayToArray() public {
        // 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉  STATE & Local variable 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈
        // Local variable <------------ STATE ================ ✅ 👨‍💻 will create COPY
        // 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉  STORAGE & STATE  Array 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈
        // storage <------------------- storage ============== ❌ Impossible, in technically. As, we can't keep a storage in Right Hand Side of an Equal Operator (=) because as soon as we declare a storage it creates a Storage Reference.
        // storage <------------------- storage reference ====
        // storage reference <--------- storage ==============
        // storage reference <--------- storage reference ====
        // STATE <------------------- STATE ==================
        // storage <----------------- STATE ==================
        // storage reference <------- STATE ==================
        // STATE <------------------- storage ================
        // STATE <------------------- storage reference ======
        // 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉  MEMORY, STORAGE, STATE Array 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈 👈
        // memory <-------------------- memory ===============
        // memory <-------------------- memory reference =====
        // memory reference <---------- memory ===============
        // memory reference <---------- memory reference =====
        // memory <------------------ storage ================
        // memory <------------------ storage reference ======
        // memory reference <-------- storage ================
        // memory reference <-------- storage reference ======
        // storage <----------------- memory =================
        // storage <----------------- memory reference =======
        // storage reference <------- memory =================
        // storage reference <------- memory reference =======
        // STATE <--------------------- memory ===============
        // STATE <--------------------- memory reference =====
        // memory <-------------------- STATE ================
        // memory reference <---------- STATE ================
        // 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉 👉  CALLDATA, MEMORY, STORAGE, STATE Array 👈 👈 👈 👈 👈 👈 👈 👈  👈 👈 👈 👈
        // calldata <------------------ calldata =============
        // calldata <------------------ calldata reference ===
        // calldata reference <-------- calldata =============
        // calldata reference <-------- calldata reference ===
        // memory <------------------ calldata ===============
        // memory <------------------ calldata reference =====
        // memory reference <-------- calldata ===============
        // memory reference <-------- calldata reference =====
        // calldata <---------------- memory =================
        // calldata <---------------- memory reference =======
        // calldata reference <------ memory =================
        // calldata reference <------ memory reference =======
        // storage <-------------------- calldata ============
        // storage <-------------------- calldata reference ==
        // storage reference <---------- calldata ============
        // storage reference <---------- calldata reference ==
        // calldata <------------------- storage =============
        // calldata <------------------- storage reference ===
        // calldata reference <--------- storage =============
        // calldata reference <--------- storage reference ===
        // STATE <------------------- calldata ===============
        // STATE <------------------- calldata reference =====
        // calldata <---------------- STATE ==================
        // calldata reference <------ STATE ==================
        /*



         */
        // What Jean Cavlr said is here from above analysis
        // 1. storage reference <---------------------------- STATE (R) + storage reference (R)
        // 2. memory reference <----------------------------- STATE (C) + storage reference (R) + memory (R) + memory reference (R) + calldata reference (C)
        // 3. calldata reference <--------------------------- calldata reference (R)
        /*



         */
        // Others rules of Assigning (Only what you can do)
        // 1. STATE <---------------------------------------- STATE (C) + storage reference (R) + memory (R) + memory reference (R) + calldata reference (R)
        // 2. storage <-------------------------------------- STATE (R) + storage reference (R)
        // 3. memory <--------------------------------------- STATE (C) + storage reference (C) + memory (R) + memory reference (R) + calldata reference (C)
        // 4. calldata <------------------------------------- calldata reference (R)
    }
}
