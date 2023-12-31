Solidity training notes.

Remix - IDE (integrated development environment)
A place where you can code, audit, compile and test your smart contracts (and eventually deploy them to main net).

Always begin by writing the spdx license identifier then the solidity version at the beginning of the contract.

Pragma solidity 0.8.19; {// stating our version

// > comment, you can input text with this that is ignored by the compiler.

using the format ^0.8.18, anything greater than that version can be used.

using >=0.8.18 <0.9.0 makes it so solidity versions between these ranges are usable for this contract.


------------------------------------------

after the solidity version, the next keyword is contract. This tells solidity the next piece of code is the name of the contract we're creating. (equivalent of a "class" in Java"

contract SimpleStorage {}
(Everything in the curly braces is considered a part of the contract simple storage.

-------------------------------------------------
Operators:
Operators allow for controlling the flow of logic in a solidity program, allowing for complex conditions and decisions to be made based on the state of variables.

Types
Solidity requires you to clearly state what kind of data each variable will hold, whether it's a simple number or something more complex. This is called being a "statically typed" language. It offers a range of basic types that you can use and mix together to create more complex types.

The solidity types are:
Bool: A true or false variable type.
Integers: signed or unsigned integers of various sizes, from (u)int8 to (u)int256. Without specifying size, defaults to 256. Make sure to use as close to the expected size as possible to reduce gas cost.
Bit Operations: Operations that directly manipulate the individual bits of a value. When performing bit operations in solidity, you're working with the binary form of numbers, flipping or combining bits in specific ways. The two's complement system helps the computer understand and work with both positive and negative numbers effectively.
address:
bytes:
string: set of words in between quotes. (a bytes object under the hood, specifically represented in text)


examples:

pragma solidity 0.8.18;

contract SimpleStorage{

bool hasFavoriteNumber = false;
uint favoriteNumber = 88;
string favoriteNumberInText = "eighty-eight";
address myAddress = 0x5BD53812ace2912278D7a9c97E23988b479FaF57;
bytes32favoriteBytes32 = "cat";

}

-----------==================-----------
https://youtu.be/umepbfKp5rI?t=9117
--------------=================---------

Functions (methods)

subsection of code that when called will execute a particular piece of the codebase.
identified by the keyword function. whatever is in the parentheses following function is what you're going to pass to your function code.

We prefix the local variables with an _ to differentiate them from state variables

if you include the view argument in a function, the contents of that function will not be allowed to change the state of any variables.

if you include the pure function, it prevents reading or changing the state of a variable.

examples:

pragma solidity 0.8.18;

contract SimpleStorage{

bool hasFavoriteNumber = false;
uint public favoriteNumber = 88;
string favoriteNumberInText = "eighty-eight";
address myAddress = 0x5BD53812ace2912278D7a9c97E23988b479FaF57;
bytes32 favoriteBytes32 = "cat";
function store(uint256 _favoriteNumber) public {
	favoriteNumber = _favoriteNumber;
	} // what this does is map the local variable _favoriteNumber to the state variable favoriteNumber when the store function is called.

function retrieve() public view returns(uint256){
	return favoriteNumber;
	}
}

-------------------------------------------------------------
Visibility
default is internal
Setting the visibility of a variable to public, that data can be called from other contracts. Visible externally and internally. Can be called from other parts of your contract or by external sources. Creates getter function for states/variables.
internal - only visible from within that function. Other contracts and people can't call on this variable. allows access in both the contract where it's declared and it's child contracts
external - only visible from external functions. (can only be assigned to functions)
private - only visible from the current contract. Can only be called from the contract in which it's declared and not it's child contracts.

------------------------------------------------------
Scope
Variables can only be viewed in the scope(curly brackets) of where it lives. you can call variables that are in the scope of a variable if it is nested within the curly brackets of it's parent function.
------------------------------------------------------
https://youtu.be/umepbfKp5rI?t=10246
------------------------------------------------------
11/15
Solidity Arrays and Structs

Array - list of values.
Arrays are structured with brackets following the variable type. Arrays are "0 indexed", so the first object is the 0th object. the second object is the first element.

Struct - a custom type of variable you create. for example, we can map the listOfFavoriteNumbers to an array of structs called Persons. When working with structs (custom types), you must define that custom type on both sides of the statement as such:
Person public myFriend = Person({variable1: value1, variable2: value2});

In the contract below, we define the list of favorite numbers in preparation to assign them to Person types. We also define the struct person, and rename FavoriteNumber to myFavoriteNumber to split it into two usable variables. We have also explicitly defined which value is mapped to which variable using the curly brackets in the person field.

example:

pragma solidity 0.8.18;

contract SimpleStorage{

bool hasFavoriteNumber = false;
uint public myFavoriteNumber = 88;
uint256 [] listOfFavoriteNumbers; // [0, 1, 2]
struct Person{
	uint256 favoriteNumber;
	string name;
}
Person public nuno = Person({favoriteNumber: 12, name: "Nuno"})
Person public laura = Person({favoriteNumber: 13, name: "Laura"})
Person public frank = Person({favoriteNumber: 69, name: "Frank"})
string favoriteNumberInText = "eighty-eight";
address myAddress = 0x5BD53812ace2912278D7a9c97E23988b479FaF57;
bytes32 favoriteBytes32 = "cat";
function store(uint256 _favoriteNumber) public {
	myFavoriteNumber = _favoriteNumber;
	} // what this does is map the local variable _favoriteNumber to the state variable favoriteNumber when the store function is called.

function retrieve() public view returns(uint256){
	return myFavoriteNumber;
	}
}