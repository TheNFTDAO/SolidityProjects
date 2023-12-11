//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract fundMe {
uint256 public myValue = 1;
uint8 minimumUsd = 5;
function fund() public payable{
//allow users to send money
//require a minimum dollar amount
myValue = myValue + 2;
require(msg.value >= minimumUsd, "didn't send enough eth");
 }
function getPrice() public view returns(uint256){
	// Eth USD price contract Address: 0x694AA1769357215DE4FAC081bf1f309aDC325306
	
	// ABI: When we import/call a contract, the ABI is imported but that brings in a lot of extra unnecessary code. Instead we can call the latestround function in particular to grab the price data. We will do it the long way first, then call the specific abi second.
 AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
 (, int price,,,) = priceFeed.latestRoundData(); //the price variable represents the price of eth in usd. We can omit the variables we don't need, but must keep the commas from them. In doing this, we are only assigning return value to the price variable, and the other variables are not assigned.
return uint256(price * 1e10); // (price times 1 with 10 zeros.)
 }
function getConversionRate(uint256 ethAmount) public view returns(uint256){// the function getConversionRate will take a uint256 ethAmount as input, and it's results will be returned publicly as a uint256 (result being $ price of eth) 

 uint256 ethPrice = getPrice();
 uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18; // To find the ethAmountInUsd we need to take the price of a whole eth from the chainlink data feed, multiply it by the amount of eth the user sent to the smart contract, and divide it by 1*10^18 because the value returned will have 18 decimal places and we want to eliminate those for a clean answer.
  return ethAmountInUsd;
 }
function withdraw() public {

 }

}