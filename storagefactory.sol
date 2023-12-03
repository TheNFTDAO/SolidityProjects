pragma solidity ^0.8.18;

import "./simpleStorage.sol";

contract storageFactory{

    simpleStorage[] public listOfSimpleStorageContracts; //This signifies that there will be an Array of SimpleStorage contracts deployed.

	function createSimpleStorageContract() public {
        simpleStorage newSimpleStorageContract = new simpleStorage();
		listOfSimpleStorageContracts.push(newSimpleStorageContract);
	}
	function sfStore(uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber) public {
	// Address
	// ABI
	simpleStorage mySimpleStorage = listOfSimpleStorageContracts[_simpleStorageIndex]; //what this line says is in the simpleStorage contract, let the mySimpleStorage function get the array of simple storage contracts generated in the listOfSimpleStorageContracts. the array _simpleStorageIndex is being wrapped in the SimpleStorage contract. Now we can call the store function directly from this contract with the following:
	mySimpleStorage.store(_NewSimpleStorageNumber);
	}
	//now we need a function that will let us get(read) data from the new variable mySimpleStorage that we just created. we can get it with the following function. 
	function sfGet(uint256 _simpleStorageIndex) public view returns(uint256){
	SimpleStorage mySimpleStorage = listOfSimpleStorageContracts[_simpleStorageIndex];
	return mySimpleStorage.retrieve();
}

}