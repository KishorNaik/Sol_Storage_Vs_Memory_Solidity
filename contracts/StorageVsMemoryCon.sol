// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.4;

import "hardhat/console.sol";

contract StorageVsMemoryCon{
    struct Item{
        uint units;
        uint price;
    }

    // By Default Store in Storage
    Item[] private itemsArrayStorage;
    Item[] private itemsArrayMemory;

    function addItemsUsingStorage() public {
        Item memory item1=Item(1,20);
        //delete itemsArray;
        itemsArrayStorage.push(item1);

        // Create a new Insatnce of Array using Storage
        Item[] storage itemStorageArray=itemsArrayStorage; // Copy Insatnce
        Item memory item2=Item(2,20);
        itemStorageArray[0]=item2; // Copy First Element
        
        uint unitsWithStorageArray=itemStorageArray[0].units;
        console.log("Units With Storage Array=>",unitsWithStorageArray);

        uint unitsWithStateVariables=itemsArrayStorage[0].units;
        console.log("Units With State Variable Array=>",unitsWithStateVariables);
        
    }

    function addItemsUsingMemory() public {
        Item memory item1=Item(1,20);
        //delete itemsArray; // Clear All Array Elements
        itemsArrayMemory.push(item1);

        // Create a new Insatnce of Array using memory
        Item[] memory itemMemoryArray=itemsArrayMemory; // Copy Instance
        Item memory item2=Item(2,20);
        itemMemoryArray[0]=item2; // Copy First Element
        
        uint unitsWithMemoryArray=itemMemoryArray[0].units;
        console.log("Units With Memory Array=>",unitsWithMemoryArray);

        uint unitsWithStateVariables=itemsArrayMemory[0].units;
        console.log("Units With State Variable Array=>",unitsWithStateVariables);
       
    }

    
}