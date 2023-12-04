pragma solidity ^0.8.18;

import "./SimpleStorage.sol";

contract storageFactory {
    simpleStorage[] public listOfSimpleStorageContracts;

    function createSimpleStorageContract() public {
        simpleStorage newSimpleStorageContract = new simpleStorage();
        listOfSimpleStorageContracts.push(newSimpleStorageContract);
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber) public {
        simpleStorage mySimpleStorage = listOfSimpleStorageContracts[_simpleStorageIndex];
        mySimpleStorage.store(_newSimpleStorageNumber);
    }

    function sfStoreString(uint256 _simpleStorageIndex, string memory _newString) public {
        simpleStorage mySimpleStorage = listOfSimpleStorageContracts[_simpleStorageIndex];
        mySimpleStorage.storeString(_newString);
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256) {
        simpleStorage mySimpleStorage = listOfSimpleStorageContracts[_simpleStorageIndex];
        return mySimpleStorage.retrieve();
    }
	   
	function sfStoreID(uint256 _simpleStorageIndex, uint256 _id) public {
        simpleStorage mySimpleStorage = listOfSimpleStorageContracts[_simpleStorageIndex];
        mySimpleStorage.storeID(_id);
    }

	function sfGetID(uint256 _storeID) public returns (uint256) {
		simpleStorage mySimpleStorage = listOfSimpleStorageContracts[_storeID];
		return mySimpleStorage.retrieveuint256();
	}

    function sfGetString(uint256 _simpleStorageIndex) public view returns(string memory) {
        simpleStorage mySimpleStorage = listOfSimpleStorageContracts[_simpleStorageIndex];
        return mySimpleStorage.retrieveString();
    }
}
