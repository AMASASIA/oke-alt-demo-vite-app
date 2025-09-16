// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract SBT is ERC721URIStorage {
    uint256 private _tokenIds;

    constructor() ERC721("SoulBoundToken", "SBT") {}

    function safeMint(address to, uint256 refId) public returns (uint256) {
        _tokenIds++;
        uint256 newId = _tokenIds;
        _mint(to, newId);
        _setTokenURI(newId, string(abi.encodePacked("sbt://", Strings.toString(refId))));
        return newId;
    }

    function _transfer(address from, address to, uint256 tokenId) internal pure override {
        revert("SBTs are non-transferable");
    }
}
