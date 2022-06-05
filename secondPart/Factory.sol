pragma solidity ^0.8.13;

contract Factory {
    function deploy(
        address _owner,
        uint _foo,
        bytes32 _salt
    ) public payable returns (address) {
        return address(new TestContract{salt : _salt}(_owner, _foo));
    }
}


contract FactoryAssembly {
    event Deploy(address addr, uint salt);
    function getByteCode(address _owner, uint _foo) public pure returns (bytes memory) {
        bytes memory byteCode = type(TestContract).creationCode;
        return abi.encodePacked(byteCode, abi.encode(_owner, _foo));
    }

    function getAddress(bytes memory byteCode, uint _salt) public view returns (address) {
        bytes32 hash = keccak256(
            abi.encodePacked(bytes1(0xff), address(this), _salt, keccak256(byteCode))
        );

        return address(uint160(uint(hash)));
    }

    function deploy(bytes memory byteCode, uint _salt) public payable {
        address addr;
        assembly {
            addr := create2(
                callvalue(),
                add(byteCode, 0x20),
                mload(byteCode),
                _salt
            )
            if iszero(extcodesize(addr)) {
                revert(0, 0)
            }
        }
        emit Deploy(addr, _salt);
    }
}


contract TestContract {
    address public owner;
    uint public foo;

    constructor(address _owner, uint _foo) payable {
        owner = _owner;
        foo = _foo;
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}