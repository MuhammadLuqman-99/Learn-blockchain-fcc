// Get funds from users
// Withdraw funds
// Set minimun funds in USD

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

import "./PriceConverter.sol";

contract FundMe {

    using PriceConverter for uint256;

    uint256 public minimunUsd = 50 * 1e18; // 1 * 10 ** 18

    address [] public funders;
    mapping( address => uint256) public addressToAmountFunded;

    function fund () public payable{
        // Want to able set a minimun fund amount in USD
        // 1.How do we sent ETH in this contract?(so sini pakai keyword yang di panggil payable membuat button kita merah )
        require(msg.value.getConversionrate() >= minimunUsd, "Didn't send");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value;
         // 1e18 = 1 * 10 ** 18 = 1000000000000000000 = 1ETH
    
        // apa jadi kalau kita sent x ckp apa yng di require?
        // dia akan jadi REVERTING
        // = undo any action before, and sent remaining gas back
    }

       function withdraw() public{
        // for loop
        // [1, 2, 3, 4]
        //  0. 1. 2. 3.
        // for(/* starting index; ending index; step amount */)
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++ ) {
            //code
            address funder = funders[funderIndex];
            addressToAmountFunded [funder] = 0;
        }
        // reset the array
        funders = new address[] (0);
        // actually withdraw the fund
        
        // - kalau mcm ni kira code yg // just comment

        // transfer 
        // msg.sender = address
        // payable(msg.sender) = payable address
        //- payable(msg.sender).transfer(address(this).balance);

        // sent 
        //- bool sendSuccess = payable(msg.sender).send(address(this).balance);
        //- require(sendSuccess, "Send Failed");

        // call
        (bool callSuccess, )= payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "callFailed");
    }
}
