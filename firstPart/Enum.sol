pragma solidity ^0.8.13;

contract Enum {
    enum Status {
        Pending,
        Shipped,
        Acceped,
        Rejected,
        Canceled
    }

    Status public status;

    function get() public view returns (Status) {
        return status;
    }

    function set(Status _status) public {
        status = _status;
    }

    fucntion cancel() public {
        status = Status.Canceled;
    }

    function reset() public {
        delete status;
    }
}