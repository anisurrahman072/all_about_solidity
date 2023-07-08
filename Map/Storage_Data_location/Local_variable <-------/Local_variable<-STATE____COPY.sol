// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.19;

contract Anis {
    mapping(address => mapping(address => uint)) public compSupplierIndex;

    address cToken = 0x64c58412d3a1aB9e8Ef915EcACdcbF102e05E82f;
    address supplier = 0x5e3127FC64A46135ca94d638A3F99fdee806A5dA;

    function insertValue() public {
        compSupplierIndex[cToken][supplier] = 1000;
    }

    function updateMappingValue() public returns (uint) {
        uint supplierIndex = compSupplierIndex[cToken][supplier]; // Inserting 1000 to supplierIndex

        compSupplierIndex[cToken][supplier] = 10; // Change STATE value. It will not change storage "supplierIndex" value

        return supplierIndex; // COPY (Value didn't change) ❌
    }

    function getValue() public view returns(uint) {
        return compSupplierIndex[cToken][supplier];
    }
}