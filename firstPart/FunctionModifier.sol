pragma solidity ^0.8.13;

contract FunctionModifier {
    address public owner;
    uint public x = 10;
    bool public locked;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    modifier validAddress(address _address) {
        require(_address != address(0), "Not valid address");
        _;
    }

    function changeOwner(address newOwner) public onlyOwner validAddress(newOwner) {
        owner = newOwner;
    }

    modifier noReetrancy() {
        require(!locked, "No reentrancy");
        locked = true;
        _;
        locked = false;
    }

    function decrement(uint i) public noReetrancy {
        x -= i;
        if (i > 1) {
            decrement(i - 1);
        }
    }
}