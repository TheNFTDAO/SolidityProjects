//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract fundMe {
uint256 public myValue = 1;
function fund() public payable{
//allow users to send money
//require a minimum dollar amount
myValue = myValue + 2;
require(msg.value > 1e18, "didn't send enough eth");
}

function withdraw() public {

}

}