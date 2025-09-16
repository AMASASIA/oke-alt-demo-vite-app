// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract TBAFactory {
    event TBACreated(address indexed tba, uint256 tokenId, uint256 chainId);

    function createAccount(address tokenContract, uint256 tokenId, uint256 chainId) public returns (address) {
        address tba = address(uint160(uint256(keccak256(abi.encodePacked(tokenContract, tokenId, chainId, block.timestamp)))));
        emit TBACreated(tba, tokenId, chainId);
        return tba;
    }
}
