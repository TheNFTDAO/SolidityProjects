// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

import "./SimpleStorage.sol";

contract storageFactory{

    SimpleStorage[] public listOfSimpleStorage; //This signifies that there will be an Array of SimpleStorage contracts deployed.

	function createSimpleStorageContract() public {
        mySimpleStorage newSimpleStorageContract = new SimpleStorage();
		listOfSimpleStorageContrcts.push(newSimpleStorageContract);
	}

}