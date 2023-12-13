//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {priceConverter} from "./priceConverter.sol";

contract fundMe {
using priceConverter for uint256;
uint256 public myValue = 1;
uint256 public minimumUsd = 5e18;
address public owner;
address[] public funders;
constructor() {
owner = msg.sender;
}
mapping(address => uint256) public addressToAmountFunded; // associate the address of the message sender from addressToAmountFunded to a number that lets us identify which number sender it was.
function fund() public payable{
//allow users to send money
//require a minimum dollar amount
msg.value.getConversionRate();
myValue = myValue + 2;
require(msg.value.getConversionRate() >= minimumUsd, "Up your money son.");
funders.push(msg.sender); // when the above executes, push the value associated with the funders variable (which would be the address that sends the funded eth, the msg.sender) into the funders array
//addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;
//instead of having a function like above be variable[value] = variable[value] + otherVariable, we can replace that with:
addressToAmountFunded[msg.sender] += msg.value;
//this means we are going to set addressToAmountFunded[msg.sender] to itself plus msg.value
 }

function withdraw() public {
for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++){
//inside the curly braces, we are saying "execute everything inside these curly braces for the duration specified in the for loop.
//the final part of the for loop (the increments), means that every time we execute the logic within the curly brackets, we are going to add 1 to the funderIndex and make the next increment whatever the logic in the increment section of the for loop is, in this case whatever the current funderIndex is plus 1, until it reaches the full length of the funders array.
//to access the 0th element of the funders array, we use the following logic:
 funders[funderIndex]; //this will return an address, since it's an array of addresses
 address funder = funders[funderIndex]; //we use this line to associate elements in the array back to the addresses associated with those indexes, and in the next line once the logic to find the address from a particular funder is found, we use the following logic to reset that addresses deposits to 0.
 addressToAmountFunded[funder] = 0;
 //Next we need to reset the array and withdraw the funds.
 
}
funders = new address[](0);
//this means the funders variable will be deployed to a new contract with a new array called address with a starting index of 0;
(bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
require(callSuccess, "Call failed");
 }

}