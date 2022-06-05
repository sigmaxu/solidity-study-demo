pragma solidity ^0.8.13;


interface IERC721 is IERC165 {
    function balanceOf(address owner) external view returns (uint balance);

    function ownerOf(uint tokenID) external view returns (address owner);

    function safeTransferFrom (
        address from,
        address to,
        uint tokenId
    )external;

    function safeTransferFrom(
        address from,
        address to,
        uint tokenId,
        bytes calldata data
    )external;

    function transferFrom(
        address from,
        address to,
        uint tokendId
    )external;

    function approve(address to, uint tokenId) external;

    function getApproved(uint tokenId) external view returns (address operator);

    function setApprovalForAll(address operator, bool _approved) external;

    function isApprovedForAll(address owner, address operator)
        external
        view 
        returns (bool);
}