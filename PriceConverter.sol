// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library PriceConverter {
    
      function getPrice() internal view returns (uint256) {
        // sbb benda ni luar blockchain so kena ada
        // ABI
        // Address = 0x8A753747A1Fa494EC906cE90E9f37563A8AF630e (tdk dkt chainlink doc data feed)
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        (,int256 price,,,) = priceFeed.latestRoundData();
        // ni eth in terms usd 
        // 1000.00000000
        // tapi chainlink dlm 8 decimal number mana kala eth 18 decimal so kena kali 10
        return uint256(price * 1e10); // 1**10 = 10000000000
    }

     function getVersion() internal view returns (uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        return priceFeed.version();
    }

    function getConversionrate(uint256 ethAmount) internal view returns (uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount ) / 1e18;
        return ethAmountInUsd;
    }
}
