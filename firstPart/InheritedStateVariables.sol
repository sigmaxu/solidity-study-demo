pragma solidity ^0.8.13;

contract A {
    string public name = "Contract A";

    function getName() public view returns (string memory) {
        return name;
    }
}


contract C is A {
    constructor() {
        name = "Contract C";
    }
}