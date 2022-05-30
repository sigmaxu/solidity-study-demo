pragma solidity ^0.8.13;

library Array{
    function remove(uint[] storage arr, uint index) public {
        require(arr.length > 0, "Can't remove from empty array");
        arr[index] = arr[arr.length - 1];
        arr.pop();
    }
}


contract TestArray {
    using Array for uint[];
    uint[] public arr;

    function testArrayRemove() public {
        for (uint i = 0; i < arr.length; i++) {
            arr.push(i);
        }

        arr.remove(1);

        assert(arr.length == 2);
        assert(arr[0] == 0);
        assert(arr[1] == 2);
    }
}