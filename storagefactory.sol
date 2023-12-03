// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "./simpleStorage.sol";

contract storageFactory{

    simpleStorage[] public listOfSimpleStorageContracts; //This signifies that there will be an Array of SimpleStorage contracts deployed.

	function createSimpleStorageContract() public {
        simpleStorage newSimpleStorageContract = new simpleStorage();
		listOfSimpleStorageContracts.push(newSimpleStorageContract);
	}

}
