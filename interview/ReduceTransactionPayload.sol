pragma solidity ^0.8.13;


contract ReduceTransactionPayload {
    modifier checkZeroAddress(address owner) {
        require(owner != address(0), "Not valid address");
        _;
    }

    modifier checkZeroToOne(
        uint param1,
        uint param2,
        uint param5
    ) 
    {
        require(param1 < 10000, "Param1 greater than 1");
        require(param2 < 10000, "Param2 greater than 1");
        require(param5 < 10000, "param5 greater than 1");
        _;
    }

    modifier checkZeroToTwo(uint param3, uint param6) {
        require(param3 < 20000, "Param3 greater than 2");
        require(param6 < 20000, "Param6 greater than 2");
        _;
    }

    function M(
        uint param1,
        uint param2,
        uint param3,
        address param4,
        uint param5,
        uint param6
    )
        public
        checkZeroAddress(param4)
        checkZeroToOne(param1, param2, param5)
        checkZeroToTwo(param3, param6)
    {
        
    }
         
}