pragma solidity ^0.8.18;

contract simpleStorage{

bool hasFavoriteNumber = false;
uint public myFavoriteNumber = 88;
uint256 [] listOfFavoriteNumbers; // [0, 1, 2]
struct Person{
	uint256 favoriteNumber;
	string name;
}
Person public nuno = Person({favoriteNumber: 12, name: "Nuno"});
Person public laura = Person({favoriteNumber: 13, name: "Laura"});
Person public frank = Person({favoriteNumber: 69, name: "Frank"});
Person[] public listOfPeople; //Defaults to empty list []
string favoriteNumberInText = "eighty-eight";
string public myStoredString;
uint256 public storeID;
address myAddress = 0x5BD53812ace2912278D7a9c97E23988b479FaF57;
bytes32 favoriteBytes32 = "cat";
function storeString(string memory _storeString) public{
	myStoredString = _storeString;
	}
function store(uint256 _favoriteNumber) public {
	myFavoriteNumber = _favoriteNumber;
	} // what this does is map the local variable _favoriteNumber to the state variable favoriteNumber when the store function is called.

mapping(string => uint256) public nameToFavoriteNumber;
//The function mapping takes a string and ties it to a uint256, is publicly visible and is called nameToFavoriteNumber

function addPerson(string memory _name, uint256 _favoriteNumber) public{
listOfPeople.push(Person(_favoriteNumber, _name) ); // Solidity sees the nested command to create a new person entry for the array inside of the parentheses, then takes that newly created person entry and uses the push entry outside of the parentheses to actually push it into the array.
nameToFavoriteNumber[_name] = _favoriteNumber; // What this line doing is declaring that in the mapping above, when a person is created their favorite number is mapped to their name to easily find it.
}
    // New function to retrieve the stored string
    function retrieveString() public view returns (string memory) {
        return myStoredString;
    }
	function retrieveuint256() public returns (uint256 memory) {
	return storeID;
}

function retrieve() public view returns(uint256){
	return myFavoriteNumber;
	}

}