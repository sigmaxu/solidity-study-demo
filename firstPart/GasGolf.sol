pragma solidity ^0.8.13;

contract GasGolf {
    uint public total;

    function sumIfEventAndLessThan99(uint[] calldata nums) external {
        uint _total = total;
        uint len = nums.length;
        for (uint i=0; i < len;i = checked_inc(i)) {
            uint num = nums[i];
            if (num % 2 == 0 && num < 99) {
                _total += num;
            }
        }
        total = _total;
    }

    function checked_inc(uint i) internal pure returns (uint) {
        unchecked {
            ++i;
        }
        return i;
    } 
}