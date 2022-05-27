pragma solidity ^0.8.13;

contract SimpleStorage {
    uint public num;

    function send(uint _num) public {
        num = _num;
    }

    function get() public view returns (uint) {
        return num;
    }
}