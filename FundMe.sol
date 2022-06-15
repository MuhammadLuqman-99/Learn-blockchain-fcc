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

    // function withdraw(){}
}
