//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {priceConverter} from "./priceConverter.sol";

contract fundMe {
using priceConverter for uint256;
uint256 public myValue = 1;
uint256 public minimumUsd = 5e18;
address[] public funders;
mapping(address => uint256) public addressToAmountFunded; // associate the address of the message sender from addressToAmountFunded to a number that lets us identify which number sender it was.
function fund() public payable{
//allow users to send money
//require a minimum dollar amount
msg.value.getConversionRate();
myValue = myValue + 2;
require(getConversionRate(msg.value) >= minimumUsd, "Up your money son.");
funders.push(msg.sender); // when the above executes, push the value associated with the funders variable (which would be the address that sends the funded eth, the msg.sender) into the funders array
 }

function withdraw() public {

 }

}