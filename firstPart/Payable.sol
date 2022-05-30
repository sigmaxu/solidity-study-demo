pragma solidity ^0.8.13;

contract Payable {
    address payable public owner;

    constructor() payable {
        owner = payable(msg.sender);
    }

    function deposit() public payable{}

    function notPayalbe() public {}

    function withdraw() public {
        uint amount = address(this).balance;
        (bool success, ) = owner.call{value : amount}("");
        require(success, "Failed to send Ether");
    }

    function transfer(address payable _to, uint _amount) public {
        (bool success, ) = _to.call{value : _amount}("");
        require(success, "Failed to send Ether");
    }
}