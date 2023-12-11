//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract fundMe {
uint256 public myValue = 1;
uint8 minimumUsd = 5;
function fund() public payable{
//allow users to send money
//require a minimum dollar amount
myValue = myValue + 2;
require(msg.value >= minimumUsd, "didn't send enough eth");
 }
function getPrice() public{
	// Eth USD price contract Address: 0x694AA1769357215DE4FAC081bf1f309aDC325306
	
	// ABI: When we import/call a contract, the ABI is imported but that brings in a lot of extra unnecessary code. Instead we can call the latestround function in particular to grab the price data.
 }
function getConversionRate() public{

 }
function withdraw() public {

 }

}