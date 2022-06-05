pragma solidity ^0.8.13;
/*
    一个基于钱包的例子
    1.任何人都可以发送ETH
    2.只有拥有者可以撤回
*/
contract EtherWallet {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    function withdraw(uint _amount) external {
        require(msg.sender == owner, "caller is not owner");
        payable(msg.sender).transfer(_amount);
    }

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}