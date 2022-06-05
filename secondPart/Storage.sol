pragma solidity ^0.8.13;

contract Storage {
    struct Mystruct {
        uint value;
    }

    Mystruct public s0 = Mystruct(123);
    Mystruct public s1 = Mystruct(456);
    Mystruct public s2 = Mystruct(789);

    function _get(uint i) internal pure returns (Mystruct storage s) {
        assembly {
            s.slot := i
        }
    }

    function get(uint i) external view returns (uint) {
        return _get(i).value;
    }

    function set(uint i, uint x) external {
        _get(i).value = x;
    }
}