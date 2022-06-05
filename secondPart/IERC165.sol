pragma solidity ^0.8.13;

interface IERC165 {
    function supportsInterface(bytes4 interfaceID) external view returns (bool);
}