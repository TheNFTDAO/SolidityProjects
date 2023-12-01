// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

import "./simpleStorage.sol";

contract storageFactory{

    SimpleStorage public mySimpleStorage;

	function createSimpleStorageContract() public {
        mySimpleStorage = new SimpleStorage();
	}

}