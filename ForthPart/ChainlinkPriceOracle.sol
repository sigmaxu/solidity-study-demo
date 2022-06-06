pragma solidity ^0.8.13;

contract ChainlinkPriceOracle {
    AggregatorV3interface internal priceFed;

    constructor() {
        priceFed = AggregatorV3interface(0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419);
    }

    function getLatestPrice() public view returns (int) {
        (
            uint80 roundID,
            int price,
            uint startedAt,
            uint timestamp,
            uint80 answeredInRound
        ) = priceFed.latestRoundData();
        return price / 1e8;
    }
}

interface AggregatorV3interface{
    function latestRoundData()
        external
        view
        returns (
            uint80 roundID,
            int answer,
            uint startedAt,
            uint updateAt,
            uint80 answeredInRound
        );
}